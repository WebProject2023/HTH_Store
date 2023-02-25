<?php

namespace App\Controller;

use App\Entity\Cart;
use App\Entity\User;
use App\Form\UserType;
use Doctrine\ORM\EntityManagerInterface;
// use Symfony\Bridge\Doctrine\ManagerRegistry;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Command\UserPasswordHashCommand;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class RegistrationController extends AbstractController
{
    /**
     * @Route("/register", name="app_register")
     */
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, 
    EntityManagerInterface $entityManager, ManagerRegistry $reg): Response
    {
        $user = new User();
        $cart = new Cart();

        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);
        $entity = $reg->getManager();

        if ($form->isSubmitted() && $form->isValid()){
            //encode the plain password
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('password')->getData()
                )
                );
                $user->setRoles(['ROLE_USER']);

                $entityManager->persist($user);
                $entityManager->flush();
                //do anything else you need here, like send an email

                $cart->setUsercart($user);

                $entity->persist($cart);
                $entity->flush();
                
                return $this->redirectToRoute('app_login');
            }

        return $this->render('registration/index.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
