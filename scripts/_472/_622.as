package _472
{
   import _1000._1003;
   import _1045.Label;
   import _1146.Fade;
   import _1146.Move;
   import _1177.CloseEvent;
   import _1177.EffectEvent;
   import _1374.Alert;
   import _1404._1407;
   import _555._570;
   import _724._11251;
   import _724._725;
   import _724._729;
   import _724._731;
   import _783.StageNotification;
   import _783.TipNotification;
   import _93._94;
   import egret.managers._1211;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   
   public class _622 extends _94
   {
      private static const STATUS_NORMAL:int = 0;
      
      private static const STATUS_SHOWING:int = 1;
      
      private static const STATUS_HIDING:int = 2;
      
      private static const STATUS_SHOW:int = 3;
      
      public var _3544:_1003;
      
      private var _5434:_1211;
      
      private var _timer:Timer;
      
      private var _5454:Fade;
      
      private var _5455:BitmapData;
      
      private var _2101:_725;
      
      private var _5456:Number;
      
      private var _5457:Number;
      
      private var _5451:Number;
      
      private var _5458:Number;
      
      private var _5459:Number;
      
      private var _5450:Number;
      
      private var _5449:Number;
      
      private var _5448:Number;
      
      private var _5447:Number;
      
      private var _1563:int;
      
      private var _5440:Vector.<Label>;
      
      private var _5442:Vector.<Move>;
      
      private var _5211:Sprite;
      
      public function _622()
      {
         this._5440 = new Vector.<Label>();
         this._5442 = new Vector.<Move>();
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._5434 = _1559._1558;
         this._3544 = new _1003();
         this._5434.stage.addChild(this._3544);
         this._3544.mouseChildren = false;
         this._3544.mouseEnabled = false;
         this._timer = new Timer(1000,1);
         this._5454 = new Fade();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(TipNotification.TIP_BOTTOM,this._5438);
         _1565(TipNotification.TIP_ALERT,this._5441);
         _1565(TipNotification.TIP_CONFIRM,this._5436);
         _1565(TipNotification.TIP_THREE_BTN,this._14652);
         _1565(TipNotification.SHOW_TIP_IMAGE,this._5432);
         _1565(TipNotification.HIDE_TIP_IMAGE,this._5430);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this._5388);
         _1565(TipNotification.SHOW_MASK,this._13360);
         _1565(TipNotification.HIDE_MASK,this._13361);
         _1565(TipNotification.SHOW_TIP_TEXT,this._13906);
         _1565(StageNotification.STOP_PICK,this._4439);
      }
      
      private function _13906(param1:TipNotification) : void
      {
         this._3544._13908(param1.data.showText,param1.data.x,param1.data.y);
         if(stage)
         {
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this._13904);
         }
      }
      
      private function _4439(param1:StageNotification) : void
      {
         this._3544._13907();
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._13904);
         }
      }
      
      private function _13904(param1:MouseEvent) : void
      {
         this._3544._13905(param1,stage.stageWidth,stage.stageHeight);
      }
      
      private function _13361(param1:TipNotification) : void
      {
         if(Boolean(this._5211) && this._5211.parent != null)
         {
            this._5211.parent.removeChild(this._5211);
         }
      }
      
      private function _13360(param1:TipNotification) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this._5211 == null)
         {
            if(Boolean(this._3544) && Boolean(this._3544.stage))
            {
               _loc2_ = this._3544.stage.stageWidth;
               _loc3_ = this._3544.stage.stageHeight;
               this._5211 = new Sprite();
               this._5211.graphics.beginFill(0,0.5);
               this._5211.graphics.drawRect(0,0,_loc2_,_loc3_);
               this._5211.graphics.endFill();
            }
         }
         if(this._5211 && this._3544 && Boolean(this._3544.stage))
         {
            this._3544.stage.addChild(this._5211);
         }
      }
      
      private function _5388(param1:TimerEvent) : void
      {
         this._3544._5445(this._2101,this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
         this._5454.stop();
         this._5454.target = this._3544._5453;
         this._5454._5444 = 0;
         this._5454._5452 = 1;
         this._5454.duration = 200;
         this._5454.removeEventListener(EffectEvent.EFFECT_END,this._5429);
         this._5454.addEventListener(EffectEvent.EFFECT_END,this._5433);
         this._5454.play();
         this._1563 = STATUS_SHOWING;
         this._timer.reset();
         this._timer.stop();
      }
      
      private function _5433(param1:Event) : void
      {
         this._5454.removeEventListener(EffectEvent.EFFECT_END,this._5433);
         this._1563 = STATUS_SHOW;
      }
      
      private function _5430(param1:TipNotification) : void
      {
         if(this._1563 == STATUS_SHOW || this._1563 == STATUS_SHOWING)
         {
            this._5454.stop();
            this._5454.target = this._3544._5453;
            this._5454._5444 = this._3544._5453.alpha;
            this._5454.duration = int(200 * this._3544._5453.alpha);
            this._5454._5452 = 0;
            this._5454.removeEventListener(EffectEvent.EFFECT_END,this._5433);
            this._5454.addEventListener(EffectEvent.EFFECT_END,this._5429);
            this._5454.play();
            this._1563 = STATUS_HIDING;
         }
         this._timer.reset();
         this._timer.stop();
      }
      
      private function _5429(param1:Event) : void
      {
         this._5454.removeEventListener(EffectEvent.EFFECT_END,this._5429);
         this._3544._5446();
         this._1563 = STATUS_NORMAL;
      }
      
      private function _5432(param1:TipNotification) : void
      {
         var _loc4_:Point = null;
         var _loc2_:DisplayObject = param1.data.render;
         this._2101 = param1.data._2104;
         if(!(Boolean(this._2101) && Boolean(_loc2_) && _loc2_.parent) || this._2101 is _729 || this._2101 is _11251)
         {
            return;
         }
         var _loc3_:Point = new Point();
         if(_loc2_.parent.parent)
         {
            _loc4_ = _loc2_.parent.parent.localToGlobal(_loc3_);
         }
         else
         {
            _loc4_ = _loc2_.parent.localToGlobal(_loc3_);
         }
         var _loc5_:Point = _loc2_.localToGlobal(_loc3_);
         var _loc6_:Number = _loc2_.parent.width;
         var _loc7_:Number = _loc2_.parent.height;
         this._5456 = _loc5_.x;
         this._5457 = _loc5_.y;
         this._5451 = _loc2_.width;
         this._5458 = _1559.application.width;
         this._5459 = _1559.application.height;
         this._5450 = _loc4_.x;
         this._5449 = _loc4_.y;
         this._5448 = _loc6_;
         this._5447 = _loc7_;
         if(this._2101 is _731)
         {
            (this._2101 as _731).loadImage();
         }
         if(!this._timer.running && this._1563 == STATUS_NORMAL)
         {
            this._timer.start();
         }
         else if(!this._timer.running)
         {
            this._5429(null);
            this._5454.stop();
            this._3544._5453.alpha = 1;
            this._3544._5445(this._2101,this._5456,this._5457,this._5451,this._5458,this._5459,this._5450,this._5449,this._5448,this._5447);
            this._1563 = STATUS_SHOW;
         }
      }
      
      private function _5436(param1:TipNotification) : void
      {
         var _2503:Function = null;
         var e:TipNotification = param1;
         _2503 = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.FIRST_BUTTON)
            {
               if(e.data.confirm != null)
               {
                  e.data.confirm();
               }
            }
            else if(param1.detail == Alert.SECOND_BUTTON)
            {
               if(e.data.cancel != null)
               {
                  e.data.cancel();
               }
            }
         };
         var confirmLabel:String = !!e.data.confirmLabel ? e.data.confirmLabel : "Alert.Confirm";
         var cancelLabel:String = !!e.data.cancelLabel ? tr(e.data.cancelLabel) : tr("Alert.Cancel");
         var alert:Alert = Alert.show(e.data.message,"",null,_2503,confirmLabel,cancelLabel);
      }
      
      private function _14652(param1:TipNotification) : void
      {
         var _2503:Function = null;
         var e:TipNotification = param1;
         _2503 = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.FIRST_BUTTON)
            {
               if(e.data.firstFun != null)
               {
                  e.data.firstFun();
               }
            }
            else if(param1.detail == Alert.SECOND_BUTTON)
            {
               if(e.data.secondFun != null)
               {
                  e.data.secondFun();
               }
            }
            else if(param1.detail == Alert.THIRD_BUTTON)
            {
               if(e.data.thirdFun != null)
               {
                  e.data.thirdFun();
               }
            }
         };
         var firstLabel:String = e.data.firstLabel;
         var secondLabel:String = e.data.secondLabel;
         var threeLabel:String = e.data.threeLabel;
         var alert:Alert = Alert.show(e.data.message,"",null,_2503,firstLabel,secondLabel,threeLabel);
      }
      
      private function _5441(param1:TipNotification) : void
      {
         this._3295(param1.data);
      }
      
      public function _3295(param1:String) : void
      {
         Alert.show(param1);
      }
      
      private function _5438(param1:TipNotification) : void
      {
         var _loc2_:Rectangle = this._2853._4384;
         var _loc3_:Label = this._5437();
         _loc3_.textAlign = TextFormatAlign.CENTER;
         _loc3_.width = 500;
         _loc3_.text = tr(param1.data);
         _loc3_.x = _loc2_.x + (_loc2_.width - _loc3_.width) * 0.5;
         _loc3_.y = _loc2_.bottom - 20;
         this._3544.addElement(_loc3_);
         var _loc4_:Move;
         (_loc4_ = this._5439()).target = _loc3_;
         _loc4_.addEventListener(EffectEvent.EFFECT_END,this._5428);
         _loc4_._5460 = _loc2_.bottom - 20;
         _loc4_.duration = 1500;
         _loc4_.play();
      }
      
      private function _5428(param1:Event) : void
      {
         var _loc2_:Move = param1.target as Move;
         _loc2_.removeEventListener(EffectEvent.EFFECT_END,this._5428);
         this._3544.removeElement(_loc2_.target as Label);
         this._5431(_loc2_.target as Label);
         this._5435(_loc2_);
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      private function _5437() : Label
      {
         if(this._5440.length > 0)
         {
            return this._5440.pop();
         }
         return new Label();
      }
      
      private function _5431(param1:Label) : void
      {
         this._5440.push(param1);
      }
      
      private function _5439() : Move
      {
         if(this._5442.length > 0)
         {
            return this._5442.pop();
         }
         return new Move();
      }
      
      private function _5435(param1:Move) : void
      {
         this._5442.push(param1);
      }
   }
}

