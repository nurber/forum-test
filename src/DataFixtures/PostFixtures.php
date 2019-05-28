<?php

namespace App\DataFixtures;

use App\Entity\Post;
use App\Model\RandomContent;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

class PostFixtures extends Fixture implements DependentFixtureInterface
{

    public const POST_COUNT = 10;

    private function getRandomUser()
    {
        $users = [$this->getReference(UserFixtures::USER_RICK),
            $this->getReference(UserFixtures::USER_MORTY),
            $this->getReference(UserFixtures::USER_BETH)];
        return $users[array_rand($users)];
    }


    public function load(ObjectManager $manager)
    {
        for ($i = 0; $i < self::POST_COUNT; $i++) {
            $post = new Post();
            $post
                ->setText(RandomContent::getRandomText())
                ->setTitle(RandomContent::getRandomTitle())
                ->setDate(RandomContent::getRandomDate())
                ->setUser($this->getRandomUser());
            $manager->persist($post);
            $this->addReference('post-' . $i, $post);
            $manager->flush();
        }
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
        );
    }

}
