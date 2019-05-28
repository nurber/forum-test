<?php

namespace App\Form;


use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SubPostType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('text', TextType::class, array(
            'label' => false,
            'attr' => array(
                'placeholder' => 'Сообщение',
            ),
        ))
            ->add('save', SubmitType::class,
                array('label' => 'Ответить',
                    'attr' => ["class" => "btn btn-success"]
                ));
    }

    public function configureOptions(OptionsResolver $resolver)
    {

    }

    public function getBlockPrefix()
    {
        return 'app_comment_type';
    }
}
