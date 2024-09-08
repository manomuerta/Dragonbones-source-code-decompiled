package _472
{
   import _1146._1145;
   import _1148._1150;
   import _1148._1152;
   import _1177.EffectEvent;
   import _1404._1407;
   import _579._580;
   import _708._717;
   import _783.TipNotification;
   import _872._1005;
   import _93._94;
   import _935._938;
   import _944.StagePanel;
   import _953._956;
   import egret.core._1112;
   import egret.utils._99;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class _623 extends _94
   {
      private var type:String = "type:default,position:center,color:white";
      
      public var _5470:_1005;
      
      public var _5466:_1005;
      
      public var _5469:_1005;
      
      public var _5474:_1005;
      
      private var _5473:uint = 4647661;
      
      private var _5480:Boolean;
      
      private var _5471:_938;
      
      private var timer:Timer;
      
      private var animate:_1145;
      
      private var _5475:_1145;
      
      public function _623()
      {
         super();
         this._5472();
         this._5479();
         this._5465();
         this._5476();
      }
      
      private function _5472() : void
      {
         this._5470 = new _1005();
         this._5466 = new _1005();
         this._5469 = new _1005();
         this._5474 = new _1005();
         this.timer = new Timer(2000,1);
      }
      
      private function _5476() : void
      {
         var _13904:Function = null;
         _13904 = function(param1:MouseEvent):void
         {
            var _loc2_:Point = null;
            if(_5480 && Boolean(_5474))
            {
               if(param1.target is _956)
               {
                  _loc2_ = _5471.stageView.globalToLocal(new Point(param1.stageX,param1.stageY));
                  _5474.x = _loc2_.x;
                  _5474.y = _loc2_.y + 10;
               }
               else
               {
                  _5474.y = _5471._4883.height + _5471._4883.y + 10;
                  _5474.x = _5471._4883.x + _5471._4883.width - _5474.width;
               }
               _5474.visible = true;
            }
         };
         if(stage)
         {
            stage.addEventListener(MouseEvent.MOUSE_MOVE,_13904);
         }
         _1565(TipNotification.SHOW_TOOL_TIP,this._13363);
         _1565(TipNotification.HIDE_TOOL_TIP,this._13362);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this._5467);
      }
      
      private function _13362(param1:TipNotification) : void
      {
         this._3344(param1.data);
      }
      
      private function _13363(param1:TipNotification) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         if(param1.data)
         {
            _loc2_ = param1.data.type;
            _loc3_ = param1.data.showText;
            if(Boolean(_loc2_) && Boolean(_loc3_))
            {
               this._3351(_loc3_,_loc2_);
            }
         }
      }
      
      private function _5467(param1:TimerEvent) : void
      {
         this._3344(_717.ANIMATE);
      }
      
      public function _3351(param1:String, param2:String) : void
      {
         var _loc3_:_1005 = null;
         this.type = param2;
         if(param2 == _717.ANIMATE)
         {
            this._5469.visible = true;
            this._5469.alpha = 1;
            this._5469._5468 = 0.6;
            this._5463();
            this._5469.showText = param1;
         }
         else if(param2 == _717.TRACE)
         {
            this._5474.showText = param1;
            this._5474.visible = true;
            this._5474._5468 = 0.4;
            this._5474._5477 = 1;
            this._5474.textFormat = new TextFormat(_1112.fontFamily,14,16777215,true);
            this._5480 = true;
            this._5464(this._5474);
         }
         else if(param2 == _717.DEFAULT || param2 == _717.HIGH_LIGHT)
         {
            _loc3_ = this._5461();
            _loc3_.showText = param1;
            _loc3_._5468 = 0.6;
            this._5464(_loc3_);
         }
      }
      
      public function _3344(param1:String) : void
      {
         this.type = param1;
         if(param1 == _717.ANIMATE)
         {
            if(this._5469.visible = this._5469.alpha == 1)
            {
               this.animate.end();
               this._5475.end();
               this._5475.play();
               return;
            }
         }
         else if(param1 == _717.TRACE)
         {
            this._5480 = false;
            this._5474.visible = false;
         }
         else if(param1 == _717.DEFAULT)
         {
            this._5470.visible = false;
         }
         else if(param1 == _717.HIGH_LIGHT)
         {
            this._5466.visible = false;
         }
      }
      
      public function _3335(param1:String) : void
      {
         this.type = param1;
         if(param1 == _717.ANIMATE)
         {
            this._5469.visible = true;
            this._5469.alpha = 1;
         }
         else if(param1 == _717.TRACE)
         {
            this._5480 = true;
            this._5474.visible = true;
         }
         else
         {
            this._5461();
         }
      }
      
      private function _5461() : _1005
      {
         var _loc1_:_1005 = null;
         if(this.type == _717.DEFAULT)
         {
            this._5466.visible = false;
            this._5470.visible = true;
            _loc1_ = this._5470;
         }
         else if(this.type == _717.HIGH_LIGHT)
         {
            this._5466.visible = true;
            this._5470.visible = false;
            this._5466.color = this._5473;
            _loc1_ = this._5466;
         }
         return _loc1_;
      }
      
      private function _5464(param1:_1005) : void
      {
         var toolTip:_1005 = param1;
         var _3176:_580 = _1407.getInstance(_580) as _580;
         var stagePanel:StagePanel = _3176.stagePanel;
         if(stagePanel == null || toolTip == null)
         {
            return;
         }
         this._5471 = stagePanel.skin as _938;
         if(!this._5471)
         {
            return;
         }
         this._5471.addElement(toolTip);
         if(toolTip == this._5470 || toolTip == this._5466)
         {
            if(this._5471._4883)
            {
               toolTip.horizontalCenter = 0;
               toolTip.top = this._5471._4883.top;
            }
         }
         else if(toolTip == this._5474)
         {
            _99(function():void
            {
               if(_5471._4883)
               {
                  toolTip.y = _5471._4883.height + _5471._4883.y + 10;
                  toolTip.x = _5471._4883.x + _5471._4883.width - _5474.width;
               }
            });
         }
         else if(toolTip == this._5469)
         {
            if(this._5471._4883)
            {
               toolTip.top = this._5471._4883.top + this._5471._4883.height + 5;
               toolTip.horizontalCenter = 0;
            }
         }
      }
      
      private function _5463() : void
      {
         this.timer.stop();
         this._5475.end();
         this._5464(this._5469);
         this.animate.end();
         this.animate.play();
      }
      
      private function _5479() : void
      {
         this.animate = new _1145(this._5469);
         this.animate.duration = 1000;
         var _loc1_:_1152 = new _1152("alpha",0,1);
         var _loc2_:Vector.<_1150> = new Vector.<_1150>();
         _loc2_.push(_loc1_);
         this.animate.motionPaths = _loc2_;
         this.animate.addEventListener(EffectEvent.EFFECT_END,this._5478);
      }
      
      private function _5478(param1:EffectEvent) : void
      {
         this.timer.stop();
         this.timer.start();
      }
      
      private function _5465() : void
      {
         this._5475 = new _1145(this._5469);
         this._5475.duration = 1000;
         var _loc1_:_1152 = new _1152("alpha",1,0);
         var _loc2_:Vector.<_1150> = new Vector.<_1150>();
         _loc2_.push(_loc1_);
         this._5475.motionPaths = _loc2_;
         this._5475.addEventListener(EffectEvent.EFFECT_END,this._5462);
      }
      
      private function _5462(param1:EffectEvent) : void
      {
         this._5469.alpha = 1;
         this._5469.visible = false;
      }
   }
}

