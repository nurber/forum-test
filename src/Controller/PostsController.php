<?php

namespace App\Controller;

use App\Repository\PostRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class PostsController extends AbstractController
{
    /**
     * @Route("/post/{id}", requirements={"id": "\d+"}, name="app_show_post")
     * @param PostRepository $postRepository
     * @param int $id
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function showPostAction(PostRepository $postRepository, int $id)
    {
        $singlePost = $postRepository->find($id);
        return $this->render('posts/show_post.html.twig', [
            'single_post' => $singlePost
        ]);
    }
}
