<?php

//Сортировка вставками
function insertSort(array $arr)
{
    $count = count($arr);
    if ($count <= 1) {
        return $arr;
    }

    for ($i = 1; $i < $count; $i++) {
        $cur_val = $arr[$i];
        $j = $i - 1;

        while (isset($arr[$j]) && $arr[$j] > $cur_val) {
            $arr[$j + 1] = $arr[$j];
            $arr[$j] = $cur_val;
            $j--;
        }
    }

    return $arr;
}

/**
 * Выполняет сортировку массива
 * @param string $str строка элементов, разделённых запятыми
 */
function sorting(string $str): string
{
    $array = array_map(function ($element) {
        return $element;
    }, explode(",", $str));

    $new_array = insertSort($array);
    return join(", ", $new_array);
}