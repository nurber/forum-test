<?php
/**
 * Created by PhpStorm.
 * User: nurb
 * Date: 28/05/2019
 * Time: 15:00
 */

namespace App\Model;


class RandomContent
{

    public static function getRandomDate(): \DateTime
    {
        $rand_epoch = rand(1558901600, 1559001600);
        return new \DateTime(date('Y-m-d H:i:s', $rand_epoch));
    }

    public static function getRandomText(): string
    {
        try {
            $text = file_get_contents('http://loripsum.net/api/1/short/decorate/');
        } catch (\Exception $e) {
            $text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            Accusantium aliquid assumenda at, cum cupiditate debitis deleniti dicta 
            eius error eum id inventore ipsa itaque magni modi nemo, nostrum odit porro provident 
            quas quis quo recusandae repellat repellendus sequi sint sit sunt suscipit ullam, vero voluptas voluptate 
            voluptatem voluptatibus. Amet aperiam facilis quae quia, repellat suscipit voluptates.
            Alias assumenda esse ipsum, laboriosam nisi nulla obcaecati pariatur possimus, quidem quisquam quod saepe 
            similique suscipit voluptate voluptates? Adipisci aliquam, aperiam debitis dignissimos excepturi hic iure, 
            laboriosam magnam quae qui reprehenderit temporibus, vitae voluptas? Cumque fuga fugiat iste iusto 
            nam ratione voluptatibus. Quasi, tenetur.';
        }

        return $text;
    }

    public static function getRandomTitle()
    {
        $words = str_word_count(static::getRandomText(), 1);
        shuffle($words);
        return implode(" ", array_slice($words, 0, 10));
    }
}