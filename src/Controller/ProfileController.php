<?php

namespace App\Controller;

use App\Repository\UserRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\BrowserKit\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasher;
use Symfony\Component\Routing\Annotation\Route;

class ProfileController extends AbstractController
{
    #[Route('/profile', name: 'app_profile')]
    public function profireAction(UserRepository $repo): Response
    {
        $user = $this->getUser();
        // $user = $get;
        $profile = $repo->getUserAccount($user);
        $message = "";
        return $this->render('profile/index.html.twig', [
            'profiles' => $profile,
            'message' => $message
        ]);
    }



    // /**
    //  * @Route("/update-profile", name="update_profile", methods={"POST"})
    //  */
    // public function changePasswordAction(UserRepository $repo, Request $req, ManagerRegistry $res,
    //  UserPasswordHasher $hasher): Response
    // {
    //     $entity = $res->getManager();
    //     $user = $this->getUser();
    //     $findUser = $repo->find($user);

    //     $currentPassword = $req->require->get('txt-currentPassword');
    //     $newPassword = $req->require->get('txt-newPassword');
    //     $passwordConfirm = $req->request->get('txt-passwordConfirm');

    //     if($currentPassword == "" or $newPassword == "" or $passwordConfirm == "")
    //     {
    //         $fullname = $req->request->get('txt-fullname');
    //         $email = $req->request->get('txt-email');
    //         $address = $req->request->get('txt-address');
    //         $gender = $req->request->get('sele-gender');
    //         $phone = $req->request->get('txt-phone');
    //         $avatar = $req->request->get('img-avatar');

    //         $findUser->setFullname($fullname);
    //         $findUser->setEmail($email);
    //         $findUser->setAddress($address);
    //         $findUser->setGender($gender);
    //         $findUser->setPhone($phone);

    //         $entity->persist($findUser);
    //         $entity->flush();

    //         $profiles = $repo->getUserAccount($user);
            
    //         $message = 'Update your profile successfully!';

    //         return $this->render('profile/index.html.twig', [
    //                     'message' => $message,
    //                     'profiles' => $profiles,
    //                     ]);
    //     }

        // if($currentPassword != "" && $newPassword != "" && $passwordConfirm != "")
        // {
        //     $password = $repo->getpass($user);
        //     $getPassword =$password[0]['Pass'];
        //     $getHasherPassword = $hasher->isPasswordValid($user, $currentPassword);

        //     if($getHasherPassword == $getPassword)
        //     {
        //         $length = strlen($newPassword);
        //         if($length < 8){
        //             $message = "Password must be more than 8 characters!";
        //         }
        //         else{
        //             if($newPassword == $passwordConfirm)
        //             {
        //                 $phone = $req->require->get('txt-name');
        //                 $avatar = $req->request->get('img-avatar');
        

        //                 $findUser->setFullname($fullname);
        //                 $findUser->setEmail($email);
        //                 $findUser->setAddress($address);
        //                 $findUser->setGender($gender);
        //                 $findUser->setPhone($phone);

        //                 $findUser->setPassword($hasher->hashPassword($user, $newPassword));

        //                 $entity->persist($findUser);
        //                 $entity->flush();

        //                 $profiles = $repo->getUserAccount($user);

        //                     $message = "Update your password successfully!";

        //                     return $this->render('profile/index.html.twig', [
        //                     'message' => $message,
        //                     'profiles' => $profiles,
        //                     ]);
        //             }
        //             else
        //             {  
        //                 $profiles = $repo->getUserAccount($user);
        //                 $message = "Confirmation password does not match!";
                        
        //                 return $this->render('profile/index.html.twig', [
        //                     'message' => $message,
        //                     'profiles' => $profiles,
        //             ]);
        //             }
        //         }
        //     }
        //     else
        //     {
        //         $message = "Current password is incorrect!";
        //         $profiles = $repo->getUserAccount($user);
        
        //         return $this->render('profile/index.html.twig', [
        //         'message' => $message,
        //         'profiles' => $profiles,
        //         ]);
        //     }
        // }
        
//         $profiles = $repo->getUserAccount($user);
//         $message = "";
//         return $this->render('profile/index.html.twig', [
//             'message' => $message,
//             'profiles' => $profiles,

//         ]);
//     }
// }
}