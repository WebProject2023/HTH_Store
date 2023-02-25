<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230223045226 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE cart_detail (id INT AUTO_INCREMENT NOT NULL, cartid_id INT DEFAULT NULL, productid_id INT DEFAULT NULL, quantity INT NOT NULL, INDEX IDX_20821DCCCD84EE75 (cartid_id), INDEX IDX_20821DCCAF89CCED (productid_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE cart_detail ADD CONSTRAINT FK_20821DCCCD84EE75 FOREIGN KEY (cartid_id) REFERENCES cart (id)');
        $this->addSql('ALTER TABLE cart_detail ADD CONSTRAINT FK_20821DCCAF89CCED FOREIGN KEY (productid_id) REFERENCES product (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE cart_detail DROP FOREIGN KEY FK_20821DCCCD84EE75');
        $this->addSql('ALTER TABLE cart_detail DROP FOREIGN KEY FK_20821DCCAF89CCED');
        $this->addSql('DROP TABLE cart_detail');
    }
}
