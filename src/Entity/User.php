<?php


// src/Entity/User.php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="fos_user")
 */
class User extends BaseUser
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="App\Entity\Post", mappedBy="user", cascade={"persist", "remove"})
     */
    private $posts;

    /**
     * @var ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="App\Entity\SubPost", mappedBy="user", cascade={"persist", "remove"})
     */
    private $subposts;


    public function __construct()
    {
        parent::__construct();
        // your own logic
    }

    /**
     * @param ArrayCollection $posts
     * @return User
     */
    public function setPosts(ArrayCollection $posts): User
    {
        $this->posts = $posts;
        return $this;
    }

    /**
     * @return ArrayCollection
     */
    public function getPosts(): ArrayCollection
    {
        return $this->posts;
    }

    /**
     * @param ArrayCollection $subposts
     * @return User
     */
    public function setSubposts(ArrayCollection $subposts): User
    {
        $this->subposts = $subposts;
        return $this;
    }

    /**
     * @return ArrayCollection
     */
    public function getSubposts(): ArrayCollection
    {
        return $this->subposts;
    }
}