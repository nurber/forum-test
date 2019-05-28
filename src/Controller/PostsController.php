<?php

namespace App\Controller;

use App\Entity\Post;
use App\Entity\SubPost;
use App\Form\PostType;
use App\Form\SubPostType;
use App\Repository\PostRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
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

        $subpost = new SubPost();
        $subpost_form = $this->createForm(SubPostType::class, $subpost, array(
            'method' => 'POST'
        ));


        $singlePost = $postRepository->find($id);
        return $this->render('posts/show_post.html.twig', [
            'single_post' => $singlePost,
            'subpost_form' => $subpost_form
        ]);
    }


    /**
     * @Route("/post/create", name="app_create_post")
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function createNewsAction(Request $request)
    {
        if ($this->getUser()) {
            $newPost = new Post();
            $form = $this->createForm(PostType::class, $newPost, array(
                'method' => 'POST'
            ));
            $form->handleRequest($request);

            if ($form->isSubmitted() && $form->isValid()) {
                $newPost->setUser($this->getUser());
                $newPost->setDate(new \DateTime('now'));
                $em = $this->getDoctrine()->getManager();
                $em->persist($newPost);
                $em->flush();

                return $this->redirectToRoute("homepage");
            }
            $showForm = $form->createView();
        } else {
            $showForm = null;
        }

        return $this->render('posts/create_post.html.twig', array(
            "form" => $showForm,
        ));
    }
}
