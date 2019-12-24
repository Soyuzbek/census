$(document).ready(function()
{
	"use strict";

	var menu = $('.mobile-menu');
	var header = $('.header');
	var hamburger = $('.header-toggle');
	var close_menu = $('.mobile-menu__close-menu');

	setHeader()

	$(window).on('resize', function(){
		setHeader()
	});

	$(window).on('scroll', function(){
		setHeader()
	});

	hamburger.on('click', function(){
		menu.addClass('active');
	});

	close_menu.on('click', function(){
		menu.removeClass('active');
	});

	function setHeader()
	{
		if ($(window).scrollTop() > 100)
		{
			header.addClass('scrolled');
		}
		else
		{
			header.removeClass('scrolled');
		}
	}
});