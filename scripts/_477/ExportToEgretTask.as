package _477
{
   import _11111._11110;
   import _120._119;
   import com.adobe.crypto.MD5;
   import com.hurlant.util.Base64;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.utils.Timer;
   
   public class ExportToEgretTask extends _119
   {
      private static const HASH_KEY:String = "Dragonbonecacheanimation";
      
      private static const URL_GET_TASK_ID:String = "http://wechatse.egret.com/apiv2/dragonbone/cacheanimation3";
      
      private static const URL_GET_RESULT:String = "http://wechatse.egret.com/apiv2/dragonbone/getanalyzebytaskid2";
      
      private var _11586:uint = 0;
      
      private var _id:String = null;
      
      public function ExportToEgretTask()
      {
         this._timer = new Timer(3000);
         this._11970 = new URLRequest();
         this._loader = new URLLoader();
         super();
         this._timer.addEventListener(TimerEvent.TIMER,this._11587);
         this._11970.method = URLRequestMethod.POST;
         this._loader.dataFormat = URLLoaderDataFormat.TEXT;
         this._loader.addEventListener(Event.COMPLETE,this._loaderHandler);
         this._loader.addEventListener(IOErrorEvent.IO_ERROR,this._loaderHandler);
         this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this._loaderHandler);
      }
      
      private function _11585() : Array
      {
         var _loc1_:String = null;
         _loc1_ = new Date().time.toString();
         var _loc2_:String = MD5.hash(HASH_KEY + _loc1_.toString());
         var _loc3_:String = null;
         return [new URLRequestHeader("timestamp",_loc1_),new URLRequestHeader("signature",_loc2_),new URLRequestHeader("userName",_loc3_)];
      }
      
      private function _loaderHandler(param1:Event) : void
      {
         var result:Object = null;
         var event:Event = param1;
         switch(event.type)
         {
            case Event.COMPLETE:
               try
               {
                  if(this._id)
                  {
                     result = JSON.parse(this._loader.data);
                     if(result.code === 200)
                     {
                        if(result.data)
                        {
                           this._save(result.data);
                        }
                        else
                        {
                           this.fail("Cloud api error.",this._loader.data);
                        }
                     }
                     else if(result.code === 477 || result.code === 603)
                     {
                        event.stopImmediatePropagation();
                        this._11589();
                     }
                     else
                     {
                        this.fail("Unknown error.",this._loader.data);
                     }
                  }
                  else
                  {
                     result = JSON.parse(this._loader.data);
                     if(result.code === 200)
                     {
                        if(result.data)
                        {
                           event.stopImmediatePropagation();
                           this._11589(result.data);
                        }
                        else
                        {
                           this.fail("Unknown error.",this._loader.data);
                        }
                     }
                     else if(result.code === 478)
                     {
                        this.fail("busy");
                     }
                     else
                     {
                        this.fail("Unknown error.",this._loader.data);
                     }
                  }
               }
               catch(e:Error)
               {
                  _11110.instance._11204._11132("ExportToEgretTask::_loaderHandler",e);
                  fail("JSON error.",_loader.data);
               }
               break;
            default:
               if(this._11586 > 3)
               {
                  this.fail(event.type,event.toString());
               }
               else
               {
                  this._11589();
               }
         }
      }
      
      private function _11587(param1:Event) : void
      {
         this._timer.stop();
         this._timer.reset();
         this._query();
      }
      
      override public function run() : void
      {
         var _loc6_:Object = null;
         super.run();
         var _loc1_:_495 = this._11540 as _495;
         if(!_loc1_)
         {
            this.fail("Input data error.");
            return;
         }
         var _loc2_:Array = _loc1_._3609._3705;
         var _loc3_:Array = [];
         var _loc4_:uint = 0;
         var _loc5_:uint = _loc2_.length;
         while(_loc4_ < _loc5_)
         {
            (_loc6_ = {}).name = _loc1_._3238.projectName;
            _loc6_.SubTexture = _loc2_[_loc4_];
            _loc3_.push(_loc6_);
            _loc4_++;
         }
         this._11970.url = URL_GET_TASK_ID;
         this._11970.data = JSON.stringify({
            "dragonBonesJSON":_loc1_._3675,
            "textureAtlasJSON":_loc3_
         });
         this._11970.requestHeaders = this._11585();
         this._loader.load(this._11970);
      }
      
      override public function stop() : void
      {
         super.stop();
         this._11588();
      }
      
      override public function complete() : void
      {
         super.complete();
         this._11588();
      }
      
      override public function fail(param1:String, param2:* = null) : void
      {
         super.fail(param1,param2);
         this._11588();
      }
      
      private function _11589(param1:String = null) : void
      {
         if(param1)
         {
            this._id = param1;
            this._11970.url = URL_GET_RESULT;
            this._11970.data = this._id;
         }
         this._timer.reset();
         this._timer.start();
      }
      
      private function _query() : void
      {
         this._11970.requestHeaders = this._11585();
         this._loader.data = null;
         this._loader.load(this._11970);
      }
      
      private function _save(param1:String) : void
      {
         this._2222 = com.hurlant.util.Base64.decodeToByteArray(param1);
         if(this._2222)
         {
            this.complete();
         }
         else
         {
            this.fail("Base64 error.",param1);
         }
      }
      
      private function _11588() : void
      {
         this._timer.removeEventListener(TimerEvent.TIMER,this._11587);
         this._timer.stop();
         this._loader.removeEventListener(Event.COMPLETE,this._loaderHandler);
         this._loader.removeEventListener(IOErrorEvent.IO_ERROR,this._loaderHandler);
         this._loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this._loaderHandler);
      }
   }
}

