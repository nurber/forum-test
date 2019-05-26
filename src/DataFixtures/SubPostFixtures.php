<?php

namespace App\DataFixtures;

use App\Entity\SubPost;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

class SubPostFixtures extends Fixture implements DependentFixtureInterface
{
    public const SUBPOST_ONE = 'Спасибо, отличные новости';
    public const SUBPOST_TWO = 'Ужас';
    public const SUBPOST_THREE = 'Мне нравится';
    public const SUBPOST_FOUR = 'Ух, ты';

    private function getRandomUser()
    {
        $users = [$this->getReference(UserFixtures::USER_RICK),
            $this->getReference(UserFixtures::USER_MORTY),
            $this->getReference(UserFixtures::USER_BETH)];
        return $users[array_rand($users)];
    }

    private function getRandomPost()
    {
        $post = [self::SUBPOST_ONE,
            self::SUBPOST_TWO,
            self::SUBPOST_THREE,
            self::SUBPOST_FOUR];
        return $post[array_rand($post)];
    }

    function getRandomDate(): \DateTime
    {
        $rand_epoch = rand(1535760000, 1543622400);
        return new \DateTime(date('Y-m-d H:i:s', $rand_epoch));
    }

    public function load(ObjectManager $manager)
    {
        for ($i = 0; $i < PostFixtures::POST_COUNT; $i++) {
            $subpost1 = new SubPost();
            $subpost1
                ->setText($this->getRandomPost())
                ->setUser($this->getRandomUser())
                ->setDate($this->getRandomDate())
                ->setPost($this->getReference('post-'.$i));
            $manager->persist($subpost1);

            $subpost2 = new SubPost();
            $subpost2
                ->setText($this->getRandomPost())
                ->setUser($this->getRandomUser())
                ->setDate($this->getRandomDate())
                ->setPost($this->getReference('post-'.$i));
            $manager->persist($subpost2);

            $subpost3 = new SubPost();
            $subpost3
                ->setText($this->getRandomPost())
                ->setUser($this->getRandomUser())
                ->setDate($this->getRandomDate())
                ->setPost($this->getReference('post-'.$i));
            $manager->persist($subpost3);

            $subpost4 = new SubPost();
            $subpost4
                ->setText($this->getRandomPost())
                ->setUser($this->getRandomUser())
                ->setDate($this->getRandomDate())
                ->setPost($this->getReference('post-'.$i));
            $manager->persist($subpost4);
        }
        $manager->flush();

    }

    /**
     * This method must return an array of fixtures classes
     * on which the implementing class depends on
     *
     * @return array
     */
    function getDependencies()
    {
        return array(
            UserFixtures::class,
            PostFixtures::class
        );
    }
}