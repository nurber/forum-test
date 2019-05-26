<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class UserFixtures extends Fixture
{
    public const USER_RICK = 'Rick';
    public const USER_MORTY = 'Morty';
    public const USER_BETH = 'Beth';

    /**
     * @param ObjectManager $manager
     */
    public function load(ObjectManager $manager)
    {
        $user = new User();
        $user
            ->setUsername('rick')
            ->setEmail('rick@gmail.com')
            ->setPlainPassword('qwerty')
            ->setEnabled(true)
            ->setRoles(['ROLE_USER']);
        $manager->persist($user);
        $manager->flush();

        $user2 = new User();
        $user2
            ->setUsername('morty')
            ->setEmail('morty@gmail.com')
            ->setPlainPassword('qwerty')
            ->setEnabled(true)
            ->setRoles(['ROLE_USER']);
        $manager->persist($user2);
        $manager->flush();

        $user3 = new User();
        $user3
            ->setUsername('beth')
            ->setEmail('beth@gmail.com')
            ->setPlainPassword('qwerty')
            ->setEnabled(true)
            ->setRoles(['ROLE_USER']);
        $manager->persist($user3);
        $manager->flush();

        $this->addReference(self::USER_RICK, $user);
        $this->addReference(self::USER_MORTY, $user2);
        $this->addReference(self::USER_BETH, $user3);
    }
}
