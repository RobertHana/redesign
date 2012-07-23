﻿package com.vsc.mc {		import flash.display.MovieClip;	import flash.display.Sprite;	import flash.text.*;	import flash.text.TextField;	import flash.text.TextFieldAutoSize;	import flash.text.TextFormat;	import flash.filters.*;	import flash.events.MouseEvent;	import com.greensock.TimelineLite;	import com.greensock.TweenMax;	import com.greensock.easing.*;		public class VSCDef extends MovieClip {		private var _wordFormat:TextFormat;		private var _defaultBG:uint = 0x0E85FF;		private var df:TextField;		public function VSCDef(inid:String, indef:String) {			// constructor code			var dropbox:MovieClip = new MovieClip();			dropbox.name = "db"+inid;			var dbShadow:DropShadowFilter = new DropShadowFilter();			dbShadow.distance = 2;			dbShadow.color = 0x000000;			dbShadow.blurX = 2;			dbShadow.blurY = 2;			dbShadow.quality = 5;			dbShadow.inner = true;			this.addChild(dropbox);			dropbox.filters = [dbShadow];			dropbox.graphics.beginFill(0x0E85FF);			dropbox.graphics.drawRoundRect(5,5,200,25,3,3);			dropbox.graphics.endFill();			this.name = "d"+inid;			if(tf == null) {				var tf:TextField = new TextField();				tf.name = "def"+inid;				//tf.autoSize = TextFieldAutoSize.LEFT;				tf.selectable = false;				//tf.mouseEnabled = false;				tf.background = false;				tf.border = false;				tf.wordWrap = true;				tf.multiline = true;				tf.height = 55;				tf.antiAliasType = flash.text.AntiAliasType.ADVANCED;				tf.defaultTextFormat = whiteFormat();				tf.embedFonts = true;				tf.text = indef;				var _cen = (this.width-tf.textWidth-5)/2;				//trace("this text width = " + tf.textWidth + " this width = " + this.width + " cen pos = " + _cen);				tf.x = 205;				tf.y = 2;				tf.width = 190;			}			this.graphics.beginFill(_defaultBG);			this.graphics.drawRoundRect(0,0,400,55,5,5);			this.graphics.endFill();			var thisShadow:DropShadowFilter = new DropShadowFilter();			thisShadow.distance = 2;			thisShadow.color = 0x323232;			thisShadow.blurX = 2;			thisShadow.blurY = 2;			thisShadow.quality = 5;			thisShadow.inner = false;			this.filters = [thisShadow];			this.addChild(tf);			tf.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownScroll);			tf.addEventListener(MouseEvent.MOUSE_OVER, mouseOverScroll);		}		public function mouseDownScroll(event:MouseEvent):void         {			var _tf:TextField = TextField(event.target);			if(_tf.scrollV < _tf.maxScrollV)			{	            _tf.scrollV++;			} else {				_tf.scrollV--;			}        } 		public function mouseOverScroll(event:MouseEvent):void		{			var _tf:TextField = TextField(event.target);			if(_tf.maxScrollV > 1)			{				var _t1:TimelineLite = new TimelineLite();				_t1.append(new TweenMax(_tf, .85, {glowFilter:{color:0x00FF00, blurX:10, blurY:10, strength:1, alpha:1}, ease:Sine.easeIn}));				_t1.append(new TweenMax(_tf, .85, {glowFilter:{color:0x000000, blurX:0, blurY:0, strength:0, alpha:0, remove:true}, ease:Sine.easeOut}));			}		}		private function whiteFormat():TextFormat {			if(_wordFormat == null) {				var myFont:Font = new GSFont();				_wordFormat = new TextFormat();				_wordFormat.font = myFont.fontName;				//_wordFormat.bold = false;				_wordFormat.kerning = true;				_wordFormat.letterSpacing = .15;				_wordFormat.size = 12;				_wordFormat.color = "0xFFFFFF";				_wordFormat.align = "left";				_wordFormat.leftMargin = 5;			}			return _wordFormat;		}	}	}