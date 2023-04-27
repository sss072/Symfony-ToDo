<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ToDoController extends AbstractController
{
    #[Route('/todo', name: 'app_to_do')]
    public function index(): Response
    {
        return $this->render('to_do/index.html.twig');
    }

    #[Route('/create', methods: ['POST'], name: 'create_task')]
    public function create(): Response
    {
        exit('to do: create a new task!');
    }
}
    
