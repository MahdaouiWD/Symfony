<?php
// src/OC/PlatformBundle/Purger/AdvertPurger.php

namespace OC\PlatformBundle\Purger;

use Doctrine\ORM\EntityManager;

class AdvertPurger
{
    private $em;
    
    public function __construct(EntityManager $em)
    {
        $this->em = $em;
    }
    
    public function purge($days)
    {
        $adverts = $this->em->getRepository('OCPlateform:Advert')->getAdvertsToPurge($days);
        
        foreach ($adverts as $advert) {
            $this->em->remove($advert);
        }
        
        $this->em->flush();
    }
}
