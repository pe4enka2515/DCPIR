<?php
$requestMethod = $_SERVER["REQUEST_METHOD"];
header('Content-Type: application/json');
$con = new mysqli("MYSQL", "user", "password", "appDB");
$answer = array();
switch ($requestMethod) {
    case 'GET':
        if (empty(isset($_GET['id']))) {
            $result = $con->query("SELECT * FROM painting");
            while ($row = $result->fetch_assoc()) {
                $answer[] = $row;
            }
        } else {
            $query_result = $con->query("SELECT * FROM painting WHERE ID = " . $_GET['id']);
            $result = $query_result->fetch_row();
            $answer = $result;
        }
        if (!empty($result)) {
            http_response_code(200);
            echo json_encode($answer);
        } else {
            http_response_code(204);
        }
        break;
    case 'POST':
        $json = file_get_contents('php://input');
        $painting = json_decode($json);
        if (!empty($painting->{'name'}) && !empty($painting->{'description'}) && !empty($painting->{'price'})) {
            $name = $painting->{'name'};
            $description = $painting->{'description'};
            $price = $painting->{'price'};
            $query_result = $con->query("SELECT * FROM painting WHERE name='" . $name . "'");
            
            $stmt = $con->prepare("INSERT INTO painting (name, description, price) VALUES (?, ?, ?)");
            $stmt->bind_param('sss', $name, $description, $price);
            $stmt->execute();
            http_response_code(201);
            
        } else {
            http_response_code(422);
        }

        break;
    case 'PUT':
        $json = file_get_contents('php://input');
        $painting = json_decode($json);
        if (!empty($painting->{'name'}) && !empty($painting->{'price'})&& !empty($painting->{'description'})) {
            if (empty(isset($_GET['id']))) {
                http_response_code(422);
            } else {
                $query_result = $con->query("SELECT * FROM painting WHERE ID='" . $_GET['id'] . "'");
                $result = $query_result->fetch_row();
                if (!empty($result)) {
                    $query_result = $con->query("SELECT * FROM painting WHERE name='" . $painting->{'name'} . "' AND ID!='" . $_GET['id'] . "'");
                    $result = $query_result->fetch_row();
                    if (!empty($result)) {
                        http_response_code(409);
                    } else {
                        $con->query("UPDATE painting SET name='" . $painting->{'name'} . "', price='" . $painting->{'price'} . "' WHERE ID='" . $_GET['id'] . "'");
                        http_response_code(200);
                    }
                } else {
                    http_response_code(204);
                }
            }
        } else {
            http_response_code(422);
        }
        break;
    case 'DELETE':
        if (empty(isset($_GET['id']))) {
            http_response_code(422);
        } else {
            $query_result = $con->query("SELECT * FROM painting WHERE ID='" . $_GET['id'] . "'");
            $result = $query_result->fetch_row();
            if (!empty($result)) {
                $query_result = $con->query("DELETE FROM painting WHERE ID='" . $_GET['id'] . "'");
                http_response_code(200);
            } else {
                http_response_code(204);
            }
        }
        break;
    default:
        http_response_code(405);
        break;
}
?>