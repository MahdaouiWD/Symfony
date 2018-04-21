<?php

namespace OC\PlatformBundle\Antispam;

use Symfony\Component\HttpKernel\Bundle\Bundle;

class Antispam extends Bundle
{
	public function isSpam($text)
	{
		return strlen($text) < 50;
	}
}