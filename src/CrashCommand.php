<?php

declare(strict_types=1);

require "vendor/autoload.php";

class CrashCommand
{
    private $debug = true;

    protected function configure() {
        $this
                // the name of the command (the part after "bin/console")
                ->setName('crash')
        ;
    }

    public function execute() {
        $tender = new \Tender();

        $object = $tender;
        $item = "owner";

        // mimic vendor/twig/twig/lib/Twig/Extension/Core.php line 1506
        var_dump(isset($object->$item));

        // this crashes!
        var_dump(array_key_exists((string) $item, $object));
    }
}

(new CrashCommand())->execute();
