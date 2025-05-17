<?
// services/ImageService.php
namespace app\components;

use Yii;
use yii\web\UploadedFile;
use yii\helpers\FileHelper;

class FaceImageMK
{

    const UPLOADS_FOLDER = 'uploads/faceID/';

    public function checkFaceID($exam_id)
    {
        $uploadedImage = $this->saveImage($exam_id);
        $profileImagePath = $this->getUserProfileImagePath();

        // return $uploadedImage;
        // Make the POST request to another URL with the image paths
        $response = $this->sendImages($uploadedImage, $profileImagePath);

        $result = [];


        // Handle the response as needed
        if ($response->isOk) {
            // Success
            $result['status'] = true;
            $result = $response->data;
            $result['errors'] = $response->errors;
            $result['message'] = $response->message;

            // Process $result['status'], $result['message'], $result['result'], etc.
        } else {
            // Handle error
            $result['status'] = false;
            $errors = $response->data;
            $result['message'] = $response->message;


            // Process $errors
        }

        return $result;
    }

    protected function uploadImage()
    {
        $imageFile = UploadedFile::getInstanceByName('imageFile'); // Assuming the form input name is 'imageFile'

        if ($imageFile !== null) {
            $uploadPath = 'path/to/save/'; // Specify your upload path
            $filename = $uploadPath . $imageFile->baseName . '.' . $imageFile->extension;

            if ($imageFile->saveAs($filename)) {
                return $filename;
            }
        }

        return null;
    }

    protected function saveImage($exam_id)
    {
        $uploadFolredUrl = STORAGE_PATH . self::UPLOADS_FOLDER . $exam_id . '/';
        if (!file_exists($uploadFolredUrl)) {
            mkdir($uploadFolredUrl, 0777, true);
        }

        $imageFile = UploadedFile::getInstanceByName('imageFile');

        if ($imageFile !== null) {
            $uploadPath = $uploadFolredUrl; // Specify your upload path
            $filename = $uploadPath . current_user_id() . '_' . time() . '.' . $imageFile->extension;

            if ($imageFile->saveAs($filename)) {
                return $uploadPath . $filename;
            }
        }

        return null;
    }

    protected function getUserProfileImagePath()
    {
        // Logic to get the current user's profile image path from the Profile table
        // Replace the following line with your actual logic
        return Yii::$app->user->identity->profile->image;
    }

    protected function sendImages($uploadedImage, $profileImagePath)
    {
        $httpClient = new \yii\httpclient\Client();

        $request = $httpClient->createRequest()
            ->setMethod('post')
            ->setUrl('http://192.168.100.77:8000/api')
            ->setData([
                'uploadedImage' => $uploadedImage,
                'profileImagePath' => $profileImagePath
            ]);

        // Add authorization bearer token to the request
        $request->addHeaders(['Authorization' => 'Bearer ' . self::getAuthToken()]);

        $response = $request->send();

        return $response;
    }

    protected static function getAuthToken()
    {
        // Logic to get the authorization bearer token
        // Replace the following line with your actual logic
        return 'your_auth_token';
    }


    protected function sendImagesss($uploadedImage, $profileImagePath)
    {
        // Logic to send images to another URL and get the response
        // You can use Yii's HTTP client or any other preferred method

        // Example using Yii's HTTP client
        $httpClient = new \yii\httpclient\Client();

        $response = $httpClient->createRequest()
            ->setMethod('post')
            ->setUrl('http://192.168.100.77:8000/api')
            ->setData([
                'uploadedImage' => $uploadedImage,
                'profileImagePath' => $profileImagePath
            ])
            ->send();

        return $response;
    }
}
