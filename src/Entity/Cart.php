<?php

namespace App\Entity;

use App\Repository\CartRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CartRepository::class)]
class Cart
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    // #[ORM\ManyToOne(inversedBy: 'carts')]
    // private ?Product $procart = null;

    #[ORM\ManyToOne(inversedBy: 'carts')]
    private ?User $usercart = null;

    // #[ORM\Column]
    // private ?int $quantity = null;

    #[ORM\OneToMany(mappedBy: 'cartid', targetEntity: CartDetail::class)]
    private Collection $cartDetails;

    public function __construct()
    {
        $this->cartDetails = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    // public function getProcart(): ?Product
    // {
    //     return $this->procart;
    // }

    // public function setProcart(?Product $procart): self
    // {
    //     $this->procart = $procart;

    //     return $this;
    // }

    public function getUsercart(): ?User
    {
        return $this->usercart;
    }

    public function setUsercart(?User $usercart): self
    {
        $this->usercart = $usercart;

        return $this;
    }

    // public function getQuantity(): ?int
    // {
    //     return $this->quantity;
    // }

    // public function setQuantity(int $quantity): self
    // {
    //     $this->quantity = $quantity;

    //     return $this;
    // }

    /**
     * @return Collection<int, CartDetail>
     */
    public function getCartDetails(): Collection
    {
        return $this->cartDetails;
    }

    public function addCartDetail(CartDetail $cartDetail): self
    {
        if (!$this->cartDetails->contains($cartDetail)) {
            $this->cartDetails->add($cartDetail);
            $cartDetail->setCartid($this);
        }

        return $this;
    }

    public function removeCartDetail(CartDetail $cartDetail): self
    {
        if ($this->cartDetails->removeElement($cartDetail)) {
            // set the owning side to null (unless already changed)
            if ($cartDetail->getCartid() === $this) {
                $cartDetail->setCartid(null);
            }
        }

        return $this;
    }
}
