<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230223045429 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE cart DROP FOREIGN KEY FK_BA388B745E4A66B');
        $this->addSql('DROP INDEX IDX_BA388B745E4A66B ON cart');
        $this->addSql('ALTER TABLE cart DROP procart_id, DROP quantity');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE cart ADD procart_id INT DEFAULT NULL, ADD quantity INT NOT NULL');
        $this->addSql('ALTER TABLE cart ADD CONSTRAINT FK_BA388B745E4A66B FOREIGN KEY (procart_id) REFERENCES product (id)');
        $this->addSql('CREATE INDEX IDX_BA388B745E4A66B ON cart (procart_id)');
    }
}
