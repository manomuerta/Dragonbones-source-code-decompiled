package _555
{
   import _11489.Curve;
   import _1177.UIEvent;
   import _13492._13496;
   import _13505._13510;
   import _1404._1407;
   import _470._11495;
   import _573.TimelinePanelController;
   import _573._572;
   import _636.AnimationEvent;
   import _708._715;
   import _783.CommandNotification;
   import _783.TimelineNotification;
   import _856.CurvePanel;
   import _93._94;
   import _97._100;
   import flash.events.MouseEvent;
   
   public class _557 extends _94
   {
      public static const CurveEaseIn:Curve = new Curve();
      
      public static const CurveEaseOut:Curve = new Curve();
      
      public static const CurveEaseInOut:Curve = new Curve();
      
      public static const CurveEaseOutIn:Curve = new Curve();
      
      CurveEaseIn.start.controlA.setTo(0.5,0);
      CurveEaseIn.start._11525.setTo(1,1);
      CurveEaseOut.start.controlA.setTo(0,0);
      CurveEaseOut.start._11525.setTo(0.5,1);
      CurveEaseInOut.start.controlA.setTo(0.5,0);
      CurveEaseInOut.start._11525.setTo(0.5,1);
      CurveEaseOutIn.start.controlA.setTo(0,0.5);
      CurveEaseOutIn.start._11525.setTo(1,0.5);
      CurveEaseIn._11514(30);
      CurveEaseOut._11514(30);
      CurveEaseInOut._11514(30);
      CurveEaseOutIn._11514(30);
      
      private var _4091:Boolean;
      
      private var _4099:CurvePanel;
      
      private var _11616:Curve = null;
      
      private var _11319:_572;
      
      private var _4100:Boolean = false;
      
      private var _11599:Array;
      
      public function _557()
      {
         this._4099 = _1407.getInstance(CurvePanel);
         this._11599 = [];
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function _1576() : void
      {
         this._4099._4108.addEventListener(MouseEvent.CLICK,this._4085);
         this._4099._4101.addEventListener(MouseEvent.CLICK,this._4085);
         this._4099._4096.addEventListener(MouseEvent.CLICK,this._4085);
         this._4099._4106.addEventListener(MouseEvent.CLICK,this._4085);
         this._4099._4113.addEventListener(MouseEvent.CLICK,this._4085);
         this._4099._4114.addEventListener(MouseEvent.CLICK,this._4085);
         this._4099._4111.addEventListener(MouseEvent.CLICK,this._4085);
         this._4099._11617.addEventListener(MouseEvent.CLICK,this._4085);
         this._4099.addEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         this._4099.addEventListener(AnimationEvent.MODIFY_FRAMES_TWEEN_CURVE,this._11615);
         _1565(TimelineNotification.SELECT_FRAMES,this._4094);
      }
      
      private function _4094(param1:TimelineNotification) : void
      {
         this._4103(param1.data as Vector.<_13496>);
      }
      
      private function onComplete(param1:UIEvent) : void
      {
         this._4100 = true;
         this._4099.removeEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         this._4099.frames = this._11599;
         this._4099.invalidateDisplayList();
      }
      
      private function _11615(param1:AnimationEvent) : void
      {
         var _loc2_:Curve = null;
         switch(param1.type)
         {
            case AnimationEvent.MODIFY_FRAMES_TWEEN_CURVE:
               _loc2_ = param1.data[0] as Curve;
               if(_loc2_)
               {
                  _loc2_._11514(30);
                  this._11614(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,2,_loc2_,false);
               }
         }
      }
      
      private function _4085(param1:MouseEvent) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:Vector.<_11495> = new Vector.<_11495>();
         var _loc5_:_13496 = null;
         switch(param1.currentTarget)
         {
            case this._4099._4113:
               this._11614(CommandNotification.MODIFY_FRAMES_TWEEN_TYPE,0,null,true);
               break;
            case this._4099._4106:
               this._11614(CommandNotification.MODIFY_FRAMES_TWEEN_TYPE,1,null,true);
               break;
            case this._4099._4108:
               this._11614(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,2,CurveEaseIn,true);
               break;
            case this._4099._4101:
               this._11614(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,2,CurveEaseOut,true);
               break;
            case this._4099._4096:
               this._11614(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,2,CurveEaseInOut,true);
               break;
            case this._4099._4114:
               _loc5_ = this._4099.frame;
               if((_loc5_) && _loc5_._11515 && Boolean(_loc5_.tweenCurve))
               {
                  this._11616 = _loc5_.tweenCurve.clone();
               }
               break;
            case this._4099._4111:
               if(this._11616)
               {
                  this._11614(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,2,this._11616,true);
               }
               break;
            case this._4099._11617:
               _loc5_ = this._4099.frame;
               if(_loc5_)
               {
                  if(_loc5_._11515)
                  {
                     this._11614(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,2,_loc5_.tweenCurve,true);
                  }
                  else if(_loc5_._13663)
                  {
                     this._11614(CommandNotification.MODIFY_FRAMES_TWEEN_TYPE,1,null,true);
                  }
                  else
                  {
                     this._11614(CommandNotification.MODIFY_FRAMES_TWEEN_TYPE,0,null,true);
                  }
               }
         }
      }
      
      private function _11614(param1:String, param2:int, param3:Curve, param4:Boolean) : void
      {
         var _loc6_:Vector.<_11495> = null;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:_13496 = null;
         var _loc5_:Array = null;
         if(param4 && Boolean(this._11599))
         {
            if(_2220._2873 == _715.ANIMATE)
            {
               _loc5_ = this._11599;
            }
            else if(_2220._2873 == _715.GENERAL)
            {
               if(!this._11319)
               {
                  this._11319 = _1407.getInstance(_572) as _572;
               }
               _loc5_ = this._11599.concat();
               this._11319._11612(_loc5_);
            }
         }
         else if(this._4099.frame)
         {
            _loc5_ = [this._4099.frame];
            if(_2220._2873 != _715.ANIMATE)
            {
               if(_2220._2873 == _715.GENERAL)
               {
                  if(!this._11319)
                  {
                     this._11319 = _1407.getInstance(_572) as _572;
                  }
                  this._11319._11612(_loc5_);
               }
            }
         }
         if(_loc5_)
         {
            _loc6_ = new Vector.<_11495>();
            _loc7_ = 0;
            _loc8_ = _loc5_.length;
            while(_loc7_ < _loc8_)
            {
               _loc9_ = _loc5_[_loc7_];
               if(_loc9_)
               {
                  _loc6_.push(_11495.create(_loc9_).add("tweenType",param2).add("tweenCurve",!!param3 ? param3.clone() : null));
               }
               _loc7_++;
            }
            _11495._11566(param1,_loc6_,this._11613);
         }
      }
      
      public function _11613(param1:Vector.<_11495>) : void
      {
         var _loc6_:_13496 = null;
         var _loc2_:TimelinePanelController = _1407.getInstance(TimelinePanelController) as TimelinePanelController;
         var _loc3_:_570 = _1407.getInstance(_570) as _570;
         _loc3_._3396();
         this._3432();
         _loc2_._3002();
         var _loc4_:uint = 0;
         var _loc5_:uint = param1.length;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = param1[_loc4_].object as _13496;
            _loc2_._3433(_loc6_);
            _loc4_++;
         }
         _loc2_._3133();
      }
      
      public function _4103(param1:Vector.<_13496>) : void
      {
         if(param1 == null || param1.length == 0)
         {
            this._11599 = null;
         }
         else
         {
            this._11599 = this._10739(param1);
         }
         if(this._4100)
         {
            this._4099.frames = this._11599;
            if(this._11616)
            {
               this._4099._4111.enabled = true;
               this._4099._4111.alpha = _100.SYMBOL_ENABLED_ALPHA;
            }
            else
            {
               this._4099._4111.enabled = false;
               this._4099._4111.alpha = _100.SYMBOL_DISABLED_ALPHA;
            }
         }
      }
      
      private function _10739(param1:Vector.<_13496>) : Array
      {
         var _loc5_:_13496 = null;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1[_loc3_];
            if(_2220._2873 === _715.GENERAL)
            {
               if(_loc5_.flag == _13510.FLAG_TRANSLATE)
               {
                  _loc2_.push(_loc5_);
               }
            }
            else if(_loc5_._13663)
            {
               _loc2_.push(_loc5_);
            }
            _loc3_++;
         }
         if(_loc2_.length == 0)
         {
            return null;
         }
         return _loc2_;
      }
      
      public function _3432() : void
      {
         if(this._4100)
         {
            this._4099.frames = this._11599;
         }
      }
   }
}

