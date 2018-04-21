<?php

namespace OC\PlatformBundle\Purger;

use Doctrine\ORM\EntityManager;

class PurgerAdvert
{
	private $em;

	public function __construct(EntityManager $entityManager)
	{
		$this->em = $entityManager;
	}

	public function purge($days)
	{
		$date = new \DateTime($days. ' days ago');

		$listAdverts = $this->em->getRepository('OCPlatformBundle:Advert')
								->getAdvertsBefore($date);

		foreach ($listAdverts as $advert) 
		{
			$advertSkills = $this->em->getRepository('OCPlatformBundle:advertSkill')
								 	 ->findBy(array('advert' => $advert));

			foreach($advertSkills as $advertSkill)
			{
				$this->em->remove($advertSkill);
			}

			$this->em->remove($advert);
		}

		$this->em->flush();
	}
}