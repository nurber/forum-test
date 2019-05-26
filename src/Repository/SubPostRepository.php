<?php

namespace App\Repository;

use App\Entity\SubPost;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method SubPost|null find($id, $lockMode = null, $lockVersion = null)
 * @method SubPost|null findOneBy(array $criteria, array $orderBy = null)
 * @method SubPost[]    findAll()
 * @method SubPost[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SubPostRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, SubPost::class);
    }

    // /**
    //  * @return SubPost[] Returns an array of SubPost objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?SubPost
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
