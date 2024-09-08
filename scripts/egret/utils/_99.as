package egret.utils
{
   public function _99(param1:Function, param2:Array = null, param3:int = 0) : void
   {
      DelayCall.getInstance()._99(param1,param2,param3);
   }
}

import egret.core._1141;
import egret.core.ns_egret;
import flash.display.Shape;
import flash.events.Event;
import flash.events.UncaughtErrorEvent;

use namespace ns_egret;

class DelayCall extends Shape
{
   private static var _instance:DelayCall;
   
   private var methodQueue:Vector.<MethodQueueElement>;
   
   private var listenForEnterFrame:Boolean = false;
   
   private var listenForRender:Boolean = false;
   
   public function DelayCall()
   {
      this.methodQueue = new Vector.<MethodQueueElement>();
      super();
   }
   
   public static function getInstance() : DelayCall
   {
      if(!_instance)
      {
         _instance = new DelayCall();
      }
      return _instance;
   }
   
   public function _99(param1:Function, param2:Array = null, param3:int = 0) : void
   {
      var _loc4_:MethodQueueElement = new MethodQueueElement(param1,param2,param3,param3 == 0);
      this.methodQueue.push(_loc4_);
      if(!this.listenForEnterFrame)
      {
         addEventListener(Event.ENTER_FRAME,this.onCallBack);
         this.listenForEnterFrame = true;
      }
      if(_loc4_.onRender)
      {
         if(!this.listenForRender && Boolean(_1141.ns_egret::stage))
         {
            _1141.ns_egret::stage.addEventListener(Event.RENDER,this.onCallBack,false,-1000);
            _1141.ns_egret::stage.invalidate();
            this.listenForRender = true;
         }
      }
   }
   
   private function onCallBack(param1:Event) : void
   {
      var errorEvent:UncaughtErrorEvent = null;
      var event:Event = param1;
      if(_1141._8707)
      {
         try
         {
            this.doCallBackFunction(event);
         }
         catch(e:Error)
         {
            if(_1141.ns_egret::stage)
            {
               errorEvent = new UncaughtErrorEvent("callLaterError",false,true,e.getStackTrace());
               _1141.ns_egret::stage.dispatchEvent(errorEvent);
            }
         }
      }
      else
      {
         this.doCallBackFunction(event);
      }
   }
   
   private function doCallBackFunction(param1:Event) : void
   {
      var _loc2_:MethodQueueElement = null;
      var _loc3_:Boolean = Boolean(param1.type == Event.RENDER);
      var _loc4_:int;
      var _loc5_:int = _loc4_ = this.methodQueue.length - 1;
      while(_loc5_ >= 0)
      {
         if(this.methodQueue.length == 0)
         {
            break;
         }
         _loc2_ = this.methodQueue[_loc5_];
         if(!(_loc3_ && !_loc2_.onRender))
         {
            if(!_loc2_.onRender)
            {
               --_loc2_.delayFrames;
            }
            if(_loc2_.delayFrames <= 0)
            {
               this.methodQueue.splice(_loc5_,1);
               _loc4_--;
               if(_loc2_.args == null)
               {
                  _loc2_.method();
               }
               else
               {
                  _loc2_.method.apply(null,_loc2_.args);
               }
            }
         }
         _loc5_--;
      }
      var _loc6_:int = int(this.methodQueue.length);
      var _loc7_:Boolean = false;
      _loc5_ = _loc4_ = Math.max(0,_loc4_);
      while(_loc5_ < _loc6_)
      {
         if(this.methodQueue[_loc5_].onRender)
         {
            _loc7_ = true;
            break;
         }
         _loc5_++;
      }
      if(!_loc7_ && Boolean(this.listenForRender))
      {
         _1141.ns_egret::stage.removeEventListener(Event.RENDER,this.onCallBack);
         this.listenForRender = false;
      }
      if(this.methodQueue.length == 0)
      {
         if(this.listenForEnterFrame)
         {
            removeEventListener(Event.ENTER_FRAME,this.onCallBack);
            this.listenForEnterFrame = false;
         }
      }
   }
}

class MethodQueueElement
{
   public var method:Function;
   
   public var args:Array;
   
   public var delayFrames:int;
   
   public var onRender:Boolean;
   
   public function MethodQueueElement(param1:Function, param2:Array = null, param3:int = 0, param4:Boolean = true)
   {
      super();
      this.method = param1;
      this.args = param2;
      this.delayFrames = param3;
      this.onRender = param4;
   }
}

