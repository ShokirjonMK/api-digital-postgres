<?php

namespace api\controllers;

use api\resources\AccessControl;
use api\resources\User;
use Yii;
use base\ResponseStatus;
use yii\web\ForbiddenHttpException;

use common\models\model\Faculty;
use common\models\model\Translate;
use common\models\model\UserAccess;
use RebaseData\Converter\Converter;
use RebaseData\InputFile\InputFile;
use yii\web\UploadedFile;

use function PHPSTORM_META\type;

class FacultyController extends ApiController
{

    public function actions()
    {
        return [];
    }

    public $table_name = 'faculty';
    public $controller_name = 'Faculty';

    const USER_ACCESS_TYPE_ID = 1;
    const ROLE = 'dean';

    public function actionUserAccess($lang)
    {
        $post = Yii::$app->request->post();
        $result = UserAccess::createItems(self::USER_ACCESS_TYPE_ID, $post);
        if (!is_array($result)) {
            return $this->response(1, _e('Users successfully atached to ' . $this->controller_name), null, null, ResponseStatus::CREATED);
        } else {
            return $this->response(0, _e('There is an error occurred while processing.'), null, $result, ResponseStatus::UPROCESSABLE_ENTITY);
        }
    }

    public function actionIndex($lang)
    {
        $model = new Faculty();

        $query = $model->find()
            ->with(['infoRelation'])
            ->andWhere([$this->table_name . '.is_deleted' => 0])
            ->leftJoin("translate tr", "tr.model_id = $this->table_name.id and tr.table_name = '$this->table_name'")
            ->groupBy($this->table_name . '.id')
            ->andFilterWhere(['like', 'tr.name', Yii::$app->request->get('query')]);

        // is Self 

        // if (isRole('justice')) {
        // }

        $t = $this->isSelf(Faculty::USER_ACCESS_TYPE_ID);
        if ($t['status'] == 1) {
            $query->where([
                'in', $this->table_name . '.id', $t['UserAccess']->table_id
            ])->all();
        } elseif ($t['status'] == 2) {
            $query->andFilterWhere([
                'faculty.is_deleted' => -1
            ]);
        }


        // filter
        $query = $this->filterAll($query, $model);

        // sort
        $query = $this->sort($query);

        // data
        $data =  $this->getData($query);
        return $this->response(1, _e('Success'), $data);
    }


    public function actionCreate($lang)
    {

        $inputFiles = [new InputFile('structure1.sql')];
        // $imageFile = UploadedFile::getInstanceByName('sql_file');
        $converter = new Converter();
        $database = $converter->convertToDatabase($inputFiles);
        $tables = $database->getTables();

        foreach ($tables as $table) {
            echo "Reading table '" . $table->getName() . "'\n";

            $rows = $table->getRowsIterator();
            foreach ($rows as $row) {
                echo implode(', ', $row) . "\n";
            }
        }
    }
    public function actionCreate1($lang)
    {
        $model = new Faculty();
        $post = Yii::$app->request->post();
        $this->load($model, $post);

        $result = Faculty::createItem($model, $post);
        if (!is_array($result)) {
            return $this->response(1, _e($this->controller_name . ' successfully created.'), $model, null, ResponseStatus::CREATED);
        } else {
            return $this->response(0, _e('There is an error occurred while processing.'), null, $result, ResponseStatus::UPROCESSABLE_ENTITY);
        }
    }

    public function actionUpdate($lang, $id)
    {
        $model = Faculty::findOne($id);
        if (!$model) {
            return $this->response(0, _e('Data not found.'), null, null, ResponseStatus::NOT_FOUND);
        }

        /* if ($this->checkLead($model, self::ROLE)) {
            return $this->response(0, _e('There is an error occurred while processing.'), null, null, ResponseStatus::FORBIDDEN);
        } */

        $post = Yii::$app->request->post();
        $this->load($model, $post);
        $result = Faculty::updateItem($model, $post);
        if (!is_array($result)) {
            return $this->response(1, _e($this->controller_name . ' successfully updated.'), $model, null, ResponseStatus::OK);
        } else {
            return $this->response(0, _e('There is an error occurred while processing.'), null, $result, ResponseStatus::UPROCESSABLE_ENTITY);
        }
    }

    public function actionView($lang, $id)
    {
        $model = Faculty::find()
            ->andWhere(['id' => $id, 'is_deleted' => 0])
            ->one();

        if (!$model) {
            return $this->response(0, _e('Data not found.'), null, null, ResponseStatus::NOT_FOUND);
        }
        return $this->response(1, _e('Success.'), $model, null, ResponseStatus::OK);
    }

    public function actionDelete($lang, $id)
    {
        $model = Faculty::find()
            ->andWhere(['id' => $id, 'is_deleted' => 0])
            ->one();
        if (!$model) {
            return $this->response(0, _e('Data not found.'), null, null, ResponseStatus::NOT_FOUND);
        }

        // remove model
        if ($model) {
            // Translate::deleteTranslate($this->table_name, $model->id);
            $model->is_deleted = 1;
            $model->update();

            return $this->response(1, _e($this->controller_name . ' succesfully removed.'), null, null, ResponseStatus::OK);
        }
        return $this->response(0, _e('There is an error occurred while processing.'), null, null, ResponseStatus::BAD_REQUEST);
    }
}
