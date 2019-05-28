<?php

namespace App\DataFixtures;

use App\Entity\SubPost;
use App\Model\RandomContent;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

class SubPostFixtures extends Fixture implements DependentFixtureInterface
{

    private function getRandomUser()
    {
        $users = [$this->getReference(UserFixtures::USER_RICK),
            $this->getReference(UserFixtures::USER_MORTY),
            $this->getReference(UserFixtures::USER_BETH)];
        return $users[array_rand($users)];
    }

    public function load(ObjectManager $manager)
    {
        for ($i = 0; $i < PostFixtures::POST_COUNT; $i++) {
            $rand_subpost_count = rand(1, 10);
            for ($k = 0; $k < $rand_subpost_count; $k++) {
                $subpost = new SubPost();
                $subpost
                    ->setText(RandomContent::getRandomText())
                    ->setUser($this->getRandomUser())
                    ->setDate(RandomContent::getRandomDate())
                    ->setPost($this->getReference('post-' . $i));
                $manager->persist($subpost);
            }
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