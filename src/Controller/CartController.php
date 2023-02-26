<?php

namespace App\Controller;

use App\Entity\Cart;
use App\Entity\CartDetail;
use App\Entity\User;
use App\Repository\CartDetailRepository;
use App\Repository\CartRepository;
use App\Repository\ProductRepository;
use App\Repository\UserRepository;
use Doctrine\Persistence\ManagerRegistry;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bridge\Doctrine\ManagerRegistry as DoctrineManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{
    /**
     * @Route("/showcart", name="show_cart")
     */
    public function cartAction(ProductRepository $repo, CartRepository $rep, CartDetailRepository $cartDetailrepo): Response
    {
        
        $user = $this->get('security.token_storage')->getToken()->getUser();
        if(!$user){
            return $this->redirectToRoute('app_login');
        }else{
            $showcart = $repo->findByCart($user->getId());
            return $this->render('cart/index.html.twig', [
                'cart'=> $showcart,
                'user'=>$user
            ]);
        }

    }



    /**
     * @Route("/cart/{id}", name="app_cart")
     */
    public function addcart(CartRepository $repo, $id, ManagerRegistry $reg, ProductRepository $prorepo, CartDetailRepository $cartDetailrepo): Response
    {
        $cartDetail = new CartDetail();
        $user = $this->getUser();

        $pro = $prorepo->find($id);
        $cart = $repo->findOneBy(['usercart' => $user]);

        $entity = $reg->getManager();

        
        $cartd = $cartDetailrepo->check($id, $cart); 

        if($cartd[0]['count'] == 0){
            $cartDetail->setCartid($cart);
            $cartDetail->setProductid($pro);
            $cartDetail->setQuantity(1);
    
            $entity->persist($cartDetail);
            $entity->flush();

            $this->addFlash(
                'info',
                'Add to cart successfully!'
            );
        }
        else{
            $quantity = $cartd[0]['quantity'] + 1;
            $cartdId = $cartd[0]['id'];

            $cartDetail = $cartDetailrepo->find($cartdId);
            $cartDetail->setQuantity($quantity);

            $entity->persist($cartDetail);
            $entity->flush();

            $this->addFlash(
                'info',
                'Add to cart successfully!'
            );
        }
        return $this->redirectToRoute('show_cart');
    }

    /**
     * @Route("/cart/delete/{id}", name="app_cart_delete")
     */
    public function delete($id, CartDetailRepository $repo, ManagerRegistry $reg): Response
    {
        $entity = $reg->getManager();
        $cartd = $repo->find($id);

        $entity->remove($cartd);
        $entity->flush();

        return $this->redirectToRoute('showcart');
    }

}
