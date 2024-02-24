#Область ОписаниеПеременных

Перем ИмяПользователя;
Перем ДатаРождения;
Перем ДельтаДень;
Перем ВариантПоздравления;
Перем НазваниеСклада;
Перем КоличествоМеталла;
Перем ДатаПодсчета; 
Перем МоментНачалаРасчета;

#КонецОбласти

#Область ОбработчикиСобытий

Процедура ПриНачалеРаботыСистемы()
	
//	ОпроситьИмяПользователя();
//	ПроверкаДанныхОрганизации();
//	УКЗ_Клиент.СортировкаМассива();
//	УКЗ_Клиент.СформироватьСтруктуру();
//	УКЗ_ВызовСервера.СфрормироватьТаблицуЗначений();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

АСИНХ Процедура ОпроситьИмяПользователя()

МоментНачалаРасчета = ТекущаяДата();
	
	ИмяПользователя 	= ЖДАТЬ ВвестиСтрокуАсинх("Иван", "Как Вас зовут?");
	ДатаРождения 		= ЖДАТЬ ВвестиДатуАсинх(, "Ваша дата рождения?", ЧастиДаты.Дата);		
	
	Если ДатаРождения = Дата('00010101') 
		ИЛИ ДатаРождения > МоментНачалаРасчета Тогда
			
		ПредупреждениеАсинх("Вы ввели неверную дату!");
		
		Возврат;	
		
	КонецЕсли;
	
	ВыбратьВариантПоздравленияПоздравить();
	
КонецПроцедуры	

АСИНХ Процедура ПроверкаДанныхОрганизации()
	
ДанныеЗаполнены = РаботаСКонстантамиВызовСервера.ДанныеОрганизацииЗаполнены();
	
	Если НЕ ДанныеЗаполнены Тогда
		
		ЖДАТЬ ПредупреждениеАсинх("Заполните данные организации!", 5, "Данные не заполнены!");
		ОткрытьФорму("ОбщаяФорма.ДанныеОрганизации");
				
	КонецЕсли;
		
КонецПроцедуры

Процедура ВыбратьВариантПоздравленияПоздравить()	
	
	ДельтаДень = (День(ДатаРождения) - День(МоментНачалаРасчета));
		
	Если Месяц(ДатаРождения) <> Месяц(МоментНачалаРасчета) 
		ИЛИ (ДельтаДень > 5 И ДельтаДень < -5) Тогда
		ВариантПоздравления = "";
	ИначеЕсли ДельтаДень = 0 Тогда			
		ВариантПоздравления = " Поздравляем Вас с Днем Рожденья!";
	ИначеЕсли ДельтаДень < 5 И ДельтаДень > 1 Тогда 
		ВариантПоздравления = " Желаем Вам хорошо отметить День Рожденья!";
	ИначеЕсли ДельтаДень < -1 И ДельтаДень > -5 Тогда 
		ВариантПоздравления = " Вы хорошо отметили День Рожденья?";
	КонецЕсли;	
		
	ПоказатьПредупреждение(,ИмяПользователя + ВариантПоздравления, ,"Приветствие");
	
	СообщитьПользователю();	
	
	УКЗ_Клиент.СортировкаМассива();
	
КонецПроцедуры

#Область БазисПрограммирования
Процедура СообщитьПользователю()
	
НазваниеСклада 		= "Основной";
КоличествоМеталла 	= 125;
ДатаПодсчета		= "01 апреля 2022 года 10 утра"; 

ДатаПодсчета 	= СтрЗаменить(ДатаПодсчета,"апреля", "04");
ДатаПодсчета 	= СтрЗаменить(ДатаПодсчета,"утра", "00 00");
Массив 			= СтрРазделить (ДатаПодсчета," ");
НашаДата 		= Дата(Массив[2],Массив[1],Массив[0],Массив[4],Массив[5],Массив[6]);

Сообщение 		= Новый СообщениеПользователю;
Сообщение.Текст = СтрШаблон("На дату %1 остаток металла на складе ""%2"": %3 шт."
				,НашаДата,НазваниеСклада,КоличествоМеталла);
Сообщение.Сообщить();

КонецПроцедуры 
#КонецОбласти
#КонецОбласти
  
