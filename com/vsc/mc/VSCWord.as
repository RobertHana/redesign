﻿package com.vsc.mc {	import flash.display.MovieClip;	import flash.display.GradientType;	import flash.display.SpreadMethod;	import flash.display.Sprite;	import flash.text.Font;	import flash.text.TextField;	import flash.text.TextFieldAutoSize;	import flash.text.TextFormat;	import flash.events.Event;	import flash.geom.Matrix;	import flash.filters.*;		public class VSCWord extends Sprite {		private var _wordFormat:TextFormat;		private var _defaultBG:uint = 0xFFFFFF;		private var tf:TextField;				public function VSCWord(inid:String, inword:String) {			/****************************			Define Variables			****************************/			//Type of Gradient we will be using			var fType:String = GradientType.LINEAR;			//Colors of our gradient in the form of an array			var colors:Array = [ 0x2A20BD, 0xFFFFFF ];			//Store the Alpha Values in the form of an array			var alphas:Array = [ 1, .25 ];			//Array of color distribution ratios.  			//The value defines percentage of the width where the color is sampled at 100%			var ratios:Array = [ 180, 255 ];			//Create a Matrix instance and assign the Gradient Box			var matr:Matrix = new Matrix();				matr.createGradientBox( 200, 25, (Math.PI/180)*90, 0, 0 );			//SpreadMethod will define how the gradient is spread. Note!!! Flash uses CONSTANTS to represent String literals			var sprMethod:String = SpreadMethod.PAD;			this.graphics.beginGradientFill( fType, colors, alphas, ratios, matr, sprMethod );			this.graphics.drawRoundRect(0,-2,200,25,3,3);			this.graphics.endFill();			this.name = "w"+inid;			if(tf == null) {				var tf:TextField = new TextField();				tf.name = inid;				tf.text = inword;				tf.autoSize = TextFieldAutoSize.LEFT;				tf.selectable = false;				tf.mouseEnabled = false;				tf.background = false;				tf.border = false;				tf.wordWrap = false;				tf.height = tf.textHeight + 35;				tf.antiAliasType = flash.text.AntiAliasType.ADVANCED;				tf.defaultTextFormat = whiteFormat();				tf.embedFonts = true;				tf.text = inword;				var _cen = (this.width-tf.textWidth-5)/2;				//trace("this text width = " + tf.textWidth + " this width = " + this.width + " cen pos = " + _cen);				tf.x = _cen;			}			this.addChild(tf);			var thisShadow:DropShadowFilter = new DropShadowFilter();			thisShadow.distance = 2;			thisShadow.color = 0x323232;			thisShadow.blurX = 2;			thisShadow.blurY = 2;			thisShadow.quality = 5;			thisShadow.inner = false;			this.filters = [thisShadow];			this.mouseChildren = false;			//this.buttonMode = true;		}		private function whiteFormat():TextFormat {			if(_wordFormat == null) {				var myFont:Font = new CalBold();				_wordFormat = new TextFormat();				_wordFormat.font = myFont.fontName;				//_wordFormat.bold = false;				_wordFormat.kerning = false;				_wordFormat.letterSpacing = .1;				_wordFormat.size = 14;				_wordFormat.color = "0xFFFFFF";				_wordFormat.align = "left";			}			return _wordFormat;		}	}	}