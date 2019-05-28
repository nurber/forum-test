<?php

namespace App\Controller;

use App\Entity\SubPost;
use App\Form\SubPostType;
use App\Repository\PostRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class SubPostsController extends AbstractController
{
    /**
     * @Route("/subpost/add/{id}", requirements={"id": "\d+"}, name="app-add-subpost")
     * @Method({"GET","HEAD", "POST"})
     * @param Request $request
     * @param int $id
     * @param PostRepository $postRepository
     * @param ObjectManager $objectManager
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function addSubPostAction(Request $request, int $id, PostRepository $postRepository, ObjectManager $objectManager)
    {
        if ($this->getUser()) {
            $subPost = new SubPost();
            $form = $this->createForm(SubPostType::class, $subPost, array(
                'method' => 'POST'
            ));
            $form->handleRequest($request);
            $subPost->setUser($this->getUser());
            $post = $postRepository->find($id);

            if ($form->isSubmitted() && $form->isValid()) {
                $subPost->setUser($this->getUser());
                $subPost->setDate(new \DateTime('now'));
                $subPost->setPost($post);
                $objectManager->persist($subPost);
                $objectManager->flush();
            }
        }


        return $this->redirect($request->headers->get('referer'));
    }
}
