<?php
namespace Ijdb\Controllers;
use \Ninja\DatabaseTable;
class Joke
{
    public function __construct(private \Ninja\DatabaseTable $jokesTable, private \Ninja\DatabaseTable $authorsTable, private \Ninja\Authentication $authentication)
    {
    }
    public function list()
    {
        $result = $this->jokesTable->findAll();
        $jokes = [];
        foreach ($result as $joke) {
            $author = $this->authorsTable->find('id', $joke['authorid'])[0];
            $jokes[] = [
                'id' => $joke['id'],
                'joketext' => $joke['joketext'],
                'jokedate' => $joke['jokedate'],
                'name' => $author['name'],
                'email' => $author['email'],
                'authorId' => $author['id']
            ];
        }
        $title = 'Joke list';
        $totalJokes = $this->jokesTable->total();
        $user = $this->authentication->getUser();
        //ob_start();
        return [
            'template' => 'jokes.html.php',
            'title' => $title,
            'variables' => [
                'totalJokes' => $totalJokes,
                'jokes' => $jokes,
                'userId' => $user['id'] ?? null
            ]
        ];
    }
    public function home()
    {
        $title = 'Internet Joke Database';
        return ['template' => 'home.html.php', 'title' => $title];
    }
    public function deleteSubmit()
    {

        $author = $this->authentication->getUser();

        $joke = $this->jokesTable->find('id', $_POST['id'])[0];

        if ($joke['authorId'] != $author['id']) {
            return;
        }

        $this->jokesTable->delete('id', $_POST['id']);

        header('location: /joke/list');
    }
    public function editSubmit($id = null)
    {
        $author = $this->authentication->getUser();
        if (isset($id)) {
            $joke = $this->jokesTable->find('id', $id)[0] ?? null;
            if ($joke['authorId'] != $author['id']) {
                return;
            }
        }
        $joke = $_POST['joke'];
        $joke['jokedate'] = new \DateTime();
        $joke['authorId'] = $author['id'];
        $this->jokesTable->save($joke);
        header('location: /joke/list');
    }
    public function edit($id = null)
    {
        if (isset($id)) {
            $joke = $this->jokesTable->find('id', $id)[0] ?? null;
        }
        $author = $this->authentication->getUser();
        $title = 'Edit joke';
        return [
            'template' => 'editjoke.html.php',
            'title' => $title,
            'variables' => [
                'joke' => $joke ?? null,
                'userId' => $author['id'] ?? null
            ]
        ];
    }
}