<?php

namespace App\Form;


use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PostType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', TextType::class, array(
                'label' => "Название темы",
                'attr' => array(
                    'placeholder' => 'Название темы',
                ),
            ))
            ->add('text', TextareaType::class, array(
                'label' => "Содержание(контент)",
                'attr' => array(
                    'placeholder' => 'Содержание',
                ),
            ))
            ->add('save', SubmitType::class,
                array('label' => 'Создать тему',
                    'attr' => ["class" => "btn btn-success"]
                ));
    }

    public function configureOptions(OptionsResolver $resolver)
    {

    }

    public function getBlockPrefix()
    {
        return 'app_news_type';
    }
}
