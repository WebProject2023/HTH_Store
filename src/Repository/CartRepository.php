<?php

namespace App\Repository;

use App\Entity\Cart;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Cart>
 *
 * @method Cart|null find($id, $lockMode = null, $lockVersion = null)
 * @method Cart|null findOneBy(array $criteria, array $orderBy = null)
 * @method Cart[]    findAll()
 * @method Cart[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CartRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Cart::class);
    }

    public function add(Cart $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Cart $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

//    /**
//     * @return Cart[] Returns an array of Cart objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('c.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Cart
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }


    /**
    * @return Cart[] Returns an array of Cart objects
    */
   public function showCart($user, $cid): array
   {
       return $this->createQueryBuilder('c')
            ->select('p.image, p.name, p.Detail, p.quantity as Quantity, p.price, cd.id as id')
            ->innerJoin('c.user', 'u')
            // ->innerJoin('c.Contains', 'cd')
            ->innerJoin('cd.product', 'p')
            ->Where('c.user = :uid')
            ->setParameter('uid', $user)
            ->andWhere('c.id = :cid')
            ->setParameter('cid', $cid)
            ->getQuery()
            ->getArrayResult()
       ;
   }

       /**
    * @return Cart[] Returns an array of Cart objects
    */
    public function sumPrice($user, $cid): array
    {
        return $this->createQueryBuilder('c')
             ->select('Sum(p.price * cd.quantity) as Total')
             ->innerJoin('c.user', 'u')
             ->innerJoin('c.Contains', 'cd')
             ->innerJoin('cd.product', 'p')
             ->Where('c.user = :uid')
             ->setParameter('uid', $user)
             ->andWhere('c.id = :cid')
             ->setParameter('cid', $cid)
             ->getQuery()
             ->getArrayResult()
        ;
    }


           /**
    * @return Cart[] Returns an array of Cart objects
    */
    public function getUserID($cid): array
    {
        return $this->createQueryBuilder('c')
             ->select('u.id as ID')
             ->innerJoin('c.user', 'u')
             ->where('c.id = :cid')
             ->setParameter('cid', $cid)
             ->getQuery()
             ->getArrayResult()
        ;
    }

    public function findByCartUser($user): array
    {
        $entity = $this->getEntityManager();
        return $entity->createQuery('
        SELECT p.name, p.price, p.image, cus.name, cd.quantity, cd.id FROM 
         App\Entity\Product p,
         App\Entity\CartDetail cd,
         App\Entity\Cart c,
         App\Entity\User cus where cus.id = c.usercart AND p.id = cd.product AND cd.cart = c.id AND
         cus.name = :user
        ')->setParameter('user', $user)
        ->getResult()
        ;
    }


    
}
