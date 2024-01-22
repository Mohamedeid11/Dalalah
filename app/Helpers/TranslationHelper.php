<?php

namespace App\Helpers;

class TranslationHelper
{
    
    public static function translate($key,$file)
    {
        $local = app()->getLocale();
        app()->setLocale($local);

        $lang_array = include(base_path('resources/lang/en/'.$file.'.php'));
        $processed_key = ucfirst(str_replace('_', ' ', TranslationHelper::remove_invalid_charcaters($key)));

        if (!array_key_exists($key, $lang_array)) {
            $lang_array[$key] = $processed_key;
            $str = "<?php return " . var_export($lang_array, true) . ";";
            file_put_contents(base_path('resources/lang/en/'.$file.'.php'), $str);
            $result = $processed_key;
        } else {
            $result = __($file.'.' . $key);
        }

        $lang_array = include(base_path('resources/lang/ar/'.$file.'.php'));
        $processed_key = ucfirst(str_replace('_', ' ', TranslationHelper::remove_invalid_charcaters($key)));

        if (!array_key_exists($key, $lang_array)) {
            $lang_array[$key] = $processed_key;
            $str = "<?php return " . var_export($lang_array, true) . ";";
            file_put_contents(base_path('resources/lang/ar/'.$file.'.php'), $str);
            $result = $processed_key;
        } else {
            $result = __($file.'.' . $key);
        }

        $result = __($file.'.' . $key);
        return $result;
    }

    public static function remove_invalid_charcaters($str)
    {
        return str_ireplace(['\'', '"', ',', ';', '<', '>', '?'], ' ', $str);
    }

}