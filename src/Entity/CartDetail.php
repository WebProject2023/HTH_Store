<?php

namespace App\Entity;

use App\Repository\CartDetailRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CartDetailRepository::class)]
class CartDetail
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'cartDetails')]
    private ?Cart $cartid = null;

    #[ORM\ManyToOne(inversedBy: 'cartDetails')]
    private ?Product $productid = null;

    #[ORM\Column]
    private ?int $quantity = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCartid(): ?Cart
    {
        return $this->cartid;
    }

    public function setCartid(?Cart $cartid): self
    {
        $this->cartid = $cartid;

        return $this;
    }

    public function getProductid(): ?Product
    {
        return $this->productid;
    }

    public function setProductid(?Product $productid): self
    {
        $this->productid = $productid;

        return $this;
    }

    public function getQuantity(): ?int
    {
        return $this->quantity;
    }

    public function setQuantity(int $quantity): self
    {
        $this->quantity = $quantity;

        return $this;
    }
}
