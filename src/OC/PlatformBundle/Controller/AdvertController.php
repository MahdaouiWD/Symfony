<?php

namespace OC\PlatformBundle\Controller;

use OC\PlatformBundle\Entity\Advert;
use Symfony\Component\HttpFoundation\Request;
use OC\PlatformBundle\Form\AdvertType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class AdvertController extends Controller
{
	public function indexAction($page)
	{
		if($page < 1)
		{
			throw $this->createNotFoundException('Page "' . $page . '" inexistante.');
		}

		$nbPerPage = 3;

		$listAdverts = $this->getDoctrine()->getManager()->getRepository('OCPlatformBundle:Advert')->getAdverts($page, $nbPerPage);

		$nbPages = ceil(count($listAdverts) / $nbPerPage);

		if($page > $nbPages)
		{
			throw $this->createNotFoundException("La page " .$page. " n'existe pas.");
			
		}

		return $this->render('OCPlatformBundle:Advert:index.html.twig', array('listAdverts' => $listAdverts, 'nbPages' => $nbPages, 'page' => $page));

	}

	public function viewAction($id, Request $request)
	{	
		$em = $this->getDoctrine()->getManager();

		$advert = $em->getRepository('OCPlatformBundle:Advert')->find($id);

		if($advert === null)
		{
			throw $this->createNotFoundException("L'annonce d'id " . $id . "n'existe pas.");
			
		}

		$listApplications = $em->getRepository('OCPlatformBundle:Application')->findBy(array('advert' => $advert));

		$listAdvertSkills = $em->getRepository('OCPlatformBundle:AdvertSkill')->findBy(array('advert' => $advert));

		return $this->render('OCPlatformBundle:Advert:view.html.twig', array('advert' => $advert, 'listApplications' => $listApplications, 'listAdvertSkills' => $listAdvertSkills));

	}

	public function addAction(Request $request)
	{
		$advert = new Advert();

		$form = $this->createForm(AdvertType::class, $advert);

		if($request->isMethod('POST') && $form->handleRequest($request)->isValid())
		{
			$em = $this->getDoctrine()->getManager();
			$em->persist($advert);
			$em->flush();

			$request->getSession()->getFlashBag()->add('notice', 'Annonce bien enregistrée.');

			return $this->redirectToRoute('oc_platform_view', array('id'=> $advert->getId()));	
		}

		return $this->render('OCPlatformBundle:Advert:add.html.twig', array('form' =>  $form->createView()));

	}

	public function editAction($id, Request $request)
	{
		$em = $this->getDoctrine()->getManager();

		$advert = $em->getRepository('OCPlatformBundle:Advert')->find($id);

		if(null === $advert)
		{
			throw $this->createNotFoundException("L'annonce d'id " . $id . " n'existe pas.");
			
		}

		$form = $this->get('form.factory')->createBuilder(FormType::class, $advert)
			->add('date', DateType::class)
			->add('title', TextType::class)
			->add('content', TextareaType::class)
			->add('author', TextType::class)
			->add('published', CheckboxType::class, array('required' => false))
			->add('save', SubmitType::class)
			->getForm();
		

		if($request->isMethod('POST'))
		{
			$em->flush();
			
			$request->getSession()->getFlashBag()->add('notice', 'Annonce bien modifiée.');

			return $this->redirectToRoute('oc_platform_view', array('id'=> $advert->getId()));

		}

		return $this->render('OCPlatformBundle:Advert:edit.html.twig', array('advert' => $advert, 'form' => $form->createView()));

	}

	public function deleteAction($id)
	{
		$em = $this->getDoctrine()->getManager();

		$advert = $em->getRepository('OCPlatformBundle:Advert')->find($id);

		if(null === $advert)
		{
			throw $this->createNotFoundException('L\'annonce d\'id ' . $id . ' n\'existe pas.');
		}

		foreach($advert->getCategories() as $category)
		{
			$advert->removeCategory($category);
		}

		$em->flush();

		return $this->render('OCPlatformBundle:Advert:delete.html.twig');

	}

	public function menuAction($limit)
	{
		$em = $this->getDoctrine()->getManager();

		$listAdverts = $em->getRepository('OCPlatformBundle:Advert')->findBy(
			array(),
			array('date'=>'desc'),
			$limit,
			0
		);


		return $this->render('OCPlatformBundle:Advert:menu.html.twig', array('listAdverts' => $listAdverts));
	}

	public function purgeAction($days, Request $request)
	{
		$purger = $this->get('oc_platform.purger.advert');
		$purger->purge($days);

		$request->getSession()->getFlashBag()->add('info', 'Les annonces ont étés purgées avec succès.');

		return $this->redirectToRoute('oc_platform_home');	
	}

}