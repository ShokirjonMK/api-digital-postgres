<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%kpi_staff}}`.
 */
class m240202_105113_create_kpi_staff_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {

        $tableName = Yii::$app->db->tablePrefix . 'kpi_staff';
        if (!(Yii::$app->db->getTableSchema($tableName, true) === null)) {
            $this->dropTable('kpi_staff');
        }

        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            // https://stackoverflow.com/questions/51278467/mysql-collation-utf8mb4-unicode-ci-vs-utf8mb4-default-collation
            // https://www.eversql.com/mysql-utf8-vs-utf8mb4-whats-the-difference-between-utf8-and-utf8mb4/
            $tableOptions = 'CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%kpi_staff}}', [
            'id' => $this->primaryKey(),
            'user_access_id' => $this->integer()->notNull(),

            'user_id' => $this->integer()->null(),
            'job_title_id' => $this->integer()->null(),
            'user_access_type_id' => $this->integer()->null(),
            'table_id' => $this->integer()->null(),
            'work_rate_id' => $this->integer()->null(),
            'work_type' => $this->integer()->null(),
            'edu_year_id' => $this->integer()->null()->defaultValue(1),
            'in_doc_all' => $this->integer(),
            'in_doc_on_time' => $this->integer(),
            'in_doc_after_time' => $this->integer(),
            'in_doc_not_done' => $this->integer(),
            'in_doc_ball' => $this->double(),
            'in_doc_percent' => $this->double(),
            'in_doc_collected_ball' => $this->double(),
            'ex_doc_all' => $this->integer(),
            'ex_doc_on_time' => $this->integer(),
            'ex_doc_after_time' => $this->integer(),
            'ex_doc_not_done' => $this->integer(),
            'ex_doc_ball' => $this->double(),
            'ex_doc_percent' => $this->double(),
            'ex_doc_collected_ball' => $this->double(),
            'ball_dep_lead' => $this->double()->check('ball_dep_lead >= 0 AND ball_dep_lead <= 10'),
            'ball_rector' => $this->double()->check('ball_rector >= 0 AND ball_rector <= 10'),
            'ball_commission' => $this->double()->check('ball_commission >= 0 AND ball_commission <= 30'),
            'ball_all' => $this->double()->check('ball_all >= 0 AND ball_all <= 100'),
            'kpi' => $this->integer()->check('kpi >= 0 AND kpi <= 200'),


            'order' => $this->tinyInteger(1)->defaultValue(1),
            'status' => $this->tinyInteger(1)->defaultValue(1),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
//            'created_at' => $this->integer()->notNull(),
//            'updated_at' => $this->integer()->notNull(),
            'created_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP'),
            'updated_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'),

            'created_by' => $this->integer()->notNull()->defaultValue(0),
            'updated_by' => $this->integer()->notNull()->defaultValue(0),
        ], $tableOptions);

        $this->addForeignKey('ks_edu_year_mk', 'kpi_staff', 'edu_year_id', 'edu_year', 'id');
        $this->addForeignKey('ks_user_access_mk', 'kpi_staff', 'user_access_id', 'user_access', 'id');


    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropForeignKey('ks_edu_year_mk', 'kpi_staff');
        $this->dropForeignKey('ks_user_access_mk', 'kpi_staff');
        $this->dropTable('{{%kpi_staff}}');
    }
}
