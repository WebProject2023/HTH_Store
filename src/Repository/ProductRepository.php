<?php

namespace App\Repository;

use App\Entity\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Product>
 *
 * @method Product|null find($id, $lockMode = null, $lockVersion = null)
 * @method Product|null findOneBy(array $criteria, array $orderBy = null)
 * @method Product[]    findAll()
 * @method Product[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Product::class);
    }

    public function save(Product $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Product $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

     /**
    * @return Product[] Returns an array of Product objects
    */
   public function findBySearchProduct($product)
   {
       return $this->createQueryBuilder('p')
           ->select('p.id, p.name, p.price, p.image')
           ->where('p.name LIKE :productName')
           ->setParameter('productName', "%${product}%")
           ->andWhere('p.status = 1')
           ->getQuery()
           ->getResult()
       ;
   }


   public function findByCartUser($user): array
   {
       $entity = $this->getEntityManager();
       return $entity->createQuery('
       SELECT p.name, p.price p.image, u.name, cd.quantity, cd.id FROM 
        App\Entity\Product p,
        App\Entity\CartDetail cd,
        App\Entity\Cart c,
        App\Entity\User u where u.id = c.usercart AND p.id = cd.productid AND cd.cartid = c.id AND
        u.name = :user
       ')->setParameter('user', $user)
       ->getResult()
       ;
   }

   public function findByCart($user): array
   {
       $entity = $this->getEntityManager();
       return $entity->createQuery('
       SELECT p.name , p.price, p.image, cd.quantity, cd.id FROM  
        App\Entity\Product p,
        App\Entity\CartDetail cd,
        App\Entity\Cart c, App\Entity\User u where u.id= :user and p.id = cd.productid and cd.cartid = c.id and c.usercart=u.id
       ')->setParameter('user', $user)
       ->getResult()
       ;
   }

//    /**
//     * @return Product[] Returns an array of Product objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('p.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Product
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
