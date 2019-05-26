<?php

namespace App\DataFixtures;

use App\Entity\Post;
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

    function getRandomDate(): \DateTime
    {
        $rand_epoch = rand(1535760000, 1543622400);
        return new \DateTime(date('Y-m-d H:i:s', $rand_epoch));
    }


    public function load(ObjectManager $manager)
    {
        for ($i = 0; $i < self::POST_COUNT; $i++) {
            try {
                $content = file_get_contents('http://loripsum.net/api/7/medium/decorate/link/ul/');
            } catch (\Exception $e) {
                $content = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            Accusantium aliquid assumenda at, cum cupiditate debitis deleniti dicta 
            eius error eum id inventore ipsa itaque magni modi nemo, nostrum odit porro provident 
            quas quis quo recusandae repellat repellendus sequi sint sit sunt suscipit ullam, vero voluptas voluptate 
            voluptatem voluptatibus. Amet aperiam facilis quae quia, repellat suscipit voluptates.
            Alias assumenda esse ipsum, laboriosam nisi nulla obcaecati pariatur possimus, quidem quisquam quod saepe 
            similique suscipit voluptate voluptates? Adipisci aliquam, aperiam debitis dignissimos excepturi hic iure, 
            laboriosam magnam quae qui reprehenderit temporibus, vitae voluptas? Cumque fuga fugiat iste iusto 
            nam ratione voluptatibus. Quasi, tenetur.';
            }

            $post = new Post();
            $post
                ->setText($content)
                ->setTitle('lorem')
                ->setDate($this->getRandomDate())
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
