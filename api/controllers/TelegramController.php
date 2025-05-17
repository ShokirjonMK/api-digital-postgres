<?php

namespace api\controllers;

use common\models\model\Profile;
use GuzzleHttp\Client;
use GuzzleHttp\Psr7\Request;
use Yii;
use yii\db\Expression;
use yii\rest\ActiveController;
use yii\web\Controller;

class TelegramController extends Controller
{
    // use ApiOpen;

    public $modelClass = '';

    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            // ...
        ];
    }

    public function beforeAction($action)
    {
        $this->enableCsrfValidation = false;
        return parent::beforeAction($action);
    }

    // public $enableCsrfValidation = false;

    public function actionBot()
    {

        // Yii::$app->controller->enableCsrfValidation = false;
        $telegram = Yii::$app->telegram;

        // $text = $telegram->input->message->text;
        // $username = $telegram->input->message->chat->username;
        // $telegram_id = $telegram->input->message->chat->id;


        $t = $telegram->sendMessage([
            'chat_id' => 813225336,
            'text' => "Assalomu alaykum " . "ehhhhh",
        ]);
        // $t =  $telegram->sendMessage([
        //     'chat_id' => 676692104,
        //     'text' => "Assalomu alaykum "  . "Husniddin",
        // ]);

        return $telegram;


        if ($text == "/start") {

            $keyboards = json_encode([
                'keyboard' => [
                    [
                        ['text' => "☎️Telefon raqamni jo`natish☎️", 'callback_data' => "/start"]
                    ]
                ], 'resize_keyboard' => true
            ]);

            $telegram->sendMessage([
                'chat_id' => $telegram_id,
                'text' => "Assalomu alaykum " . $username . " ",
                'reply_markup' => $keyboards
            ]);
        }

        if ($text == "☎️Telefon raqamni jo`natish☎️") {
            $replyMarkup3 = [
                'keyboard' => [[[
                    'text' => 'Telefon raqamni jo`nating...',
                    'request_contact' => true,
                ]]],
                'resize_keyboard' => true,
                'request_contact' => true,
            ];
            $encodedMarkup = json_encode($replyMarkup3);
            $telegram->sendMessage([
                'chat_id' => $telegram_id,
                'text' => "Telefon raqamni jo`nating...",
                'reply_markup' => $encodedMarkup
            ]);
            die;
        }

        if (json_encode($telegram->input->message->contact) != "null") {
            $test = json_encode($telegram->input->message->contact);
            $new_test = json_decode($test);
            $phone = (int)$new_test->phone_number;

            $new_phone = "(" . mb_substr($phone, 3, 2) . ")-" . mb_substr($phone, 5, 3) . "-" . mb_substr($phone, 8, 4);

            $new_phone = preg_replace('/[^0-9]/', '', $new_phone);

            $student = Profile::find()
                ->select([
                    new Expression("replace(replace(phone, '-', ''), ' ', '') as number"),
                    new Expression("replace(replace(phone_secondary, '-', ''), ' ', '') as father_number"),
                    // new Expression("replace(replace(mother_number, '-', ''), ' ', '') as mother_number"),
                    'telegram_chat_id',
                    'last_name',
                    'first_name',
                    'user_id',
                ])
                ->orWhere(['number' => $new_phone])
                ->orWhere(['father_number' => $new_phone])
                ->one();


            if ($student) {
                if ($student->telegram_chat_id) {
                    $arr = explode("-", $student->telegram_chat_id);
                    if (!in_array($telegram_id, $arr)) {
                        $student->telegram_chat_id = $student->telegram_chat_id . "-" . $telegram_id;
                    }
                } else {
                    $student->telegram_chat_id = json_encode($telegram_id);
                }
                $student->save(false);

                $telegram->sendMessage([
                    'chat_id' => $telegram_id,
                    'text' => $student->full_name . "-" . $new_phone
                ]);
            } else {
                $telegram->sendMessage([
                    'chat_id' => $telegram_id,
                    'text' => "+998" . $new_phone . " raqamdan ro`yxatdan o`tgan o`quvchi topilmadi!!!"

                ]);
            }
        }
    }

    public function actionIndex()
    {
        $data = [];
        $error = [];
        $data['status'] = false;

        $client = new Client([
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . '80fb263fb349f7fe73ebf2d53a4fe16666706387',
//                'Authorization' => 'Bearer ' . self::getAuthToken(),
            ]
        ]);

        $response = $client->post(
            'http://192.168.100.77:8005/check-face',
            ['body' => json_encode(
                [
                    "origin_image" => "https://api-digital.tsul.uz/storage/user_images_new/40102941670048.png",
                    "real_image" => "https://api-digital.tsul.uz/storage/user_images_new/43110976520017.png"
                ]
            )]
        );

        $res = json_decode($response->getBody()->getContents());


//        $data = [];
//        $error = [];
//        $data['status'] = false;
//
//
//        $client = new Client([
//            'headers' => [
//                'Content-Type' => 'application/json',
//            ]
//        ]);
//
//        $response = $client->post(
//            'http://192.168.100.77:8005/check-face',
//            ['body' => json_encode(
//                [
//                    "origin_image" => "https://api-digital.tsul.uz/storage/user_images_new/40102941670048.png",
//                    "real_image" => "https://api-digital.tsul.uz/storage/user_images_new/43110976520017.png"
//                ]
//            )]
//        );
//
//        $res = json_decode($response->getBody()->getContents());


        dd($res);
    }


    public function actionIndexssss()
    {
        Yii::$app->controller->enableCsrfValidation = false;


        Yii::$app->telegram->sendPhoto([
            'chat_id' => -615678452,
            'photo' => 'https://api-digital.tsul.uz/storage/user_images/62507025840016.png',
            'caption' => 'this is test'
        ]);

        /* ************** */
        $telegram = Yii::$app->telegram;
        $telegram->sendMessage([
            'chat_id' => 813225336,
            'text' => "sdf sdf sdf sdf sdf !!!"

        ]);
        return 0;
    }
}
