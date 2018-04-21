<?php

namespace OC\PlatformBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use OC\PlatformBundle\Entity\Advert;

class LoadAdvert implements FixtureInterface
{
	public function load(ObjectManager $manager)
	{
		$ads = array(
			array
			(
				'title' => 'Développeur PHP/MySQL',
				'author' => 'CGI',
				'content' => 'blablablablabla...'
			),
			array
			(
				'title' => 'Développeur JAVA/J2EE',
				'author' => 'Atos',
				'content' => 'blablablablabla...'
			),
			array
			(
				'title' => 'Développeur PHP/Symfony',
				'author' => 'Capgemini',
				'content' => 'blablablablabla...'
			),
			array
			(
				'title' => 'Développeur PYTHON',
				'author' => 'Orange',
				'content' => 'blablablablabla...'
			)
		);

		foreach ($ads as $ad) 
		{
			$advert = new Advert();
			$advert->setTitle($ad['title'])
				   ->setAuthor($ad['author'])
				   ->setContent($ad['content']);

			$manager->persist($advert);
		}

		$manager->flush();
	}
}