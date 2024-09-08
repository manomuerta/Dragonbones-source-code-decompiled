package _609
{
   import _1009._1036;
   import _120._121;
   import _120._123;
   import _1404._1407;
   import _477.ExportController;
   import _477._479;
   import _477._482;
   import _477._507;
   import _51._71;
   import _721._720;
   import _721._765;
   import _93._94;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class _619 extends _94
   {
      public static const MAX_BITMAP_WIDTH:int = 4096;
      
      public static const MAX_BITMAP_HEIGHT:int = 4096;
      
      private var _5426:_1036;
      
      private var _3639:_765;
      
      private var _5424:BitmapData;
      
      private var _5423:Object;
      
      private var _3254:_71;
      
      private var _5419:BitmapData;
      
      public var _3655:Function;
      
      public function _619()
      {
         super();
      }
      
      public function _3310(param1:_765) : void
      {
         if(this._5424)
         {
            this._5424.dispose();
            this._5424 = null;
         }
         this._5423 = null;
         this._3639 = param1;
         var _loc2_:Boolean = true;
         if(this._3639.exportType == _720.EXPORT_TYPE_MOVIECLIP)
         {
            _loc2_ = false;
         }
         this._5426 = new _1036(this._3639,_loc2_);
         this._5426.callback = this.preview;
         this._5426.open();
         this._5426.addEventListener(Event.CLOSE,this._5422);
      }
      
      private function _5422(param1:Event) : void
      {
         this._3254 = null;
      }
      
      private function preview() : void
      {
         var _loc1_:_123 = new _123();
         if(_621.instance.images == null)
         {
            _loc1_._2389(new _479());
            _loc1_._2389(new _482());
         }
         _loc1_._2389(new _507());
         _loc1_._2389(new _611());
         _loc1_._2389(new _612());
         _loc1_._2389(new _618());
         _loc1_._2389(new _613());
         _loc1_._2389(new HandleSquareTask());
         _loc1_._2389(new HandleBackgroundColorTask());
         _loc1_._2389(new HandleTransparentBgTask());
         _loc1_.addEventListener(_121.COMPLETE,this._3702);
         _loc1_.addEventListener(_121.FAIL,this._3703);
         _loc1_.run();
      }
      
      private function _3703(param1:_121) : void
      {
         param1.target.addEventListener(_121.COMPLETE,this._3702);
         param1.target.addEventListener(_121.FAIL,this._3703);
         this._3602._3635(param1.data);
         if(param1.data.type == ExportController.EXPORT_ERROR_TOO_LARGE)
         {
            if(this._5426)
            {
               this._5426._5425();
            }
            this.preview();
         }
         else
         {
            if(this._5426)
            {
               this._5426._5421 = null;
            }
            if(this._3655 != null)
            {
               this._3655(null);
            }
         }
      }
      
      private function _3702(param1:_121) : void
      {
         var _loc2_:Vector.<BitmapData> = null;
         param1.target.addEventListener(_121.COMPLETE,this._3702);
         param1.target.addEventListener(_121.FAIL,this._3703);
         if(Boolean(_621.instance._3690) && _621.instance._3690.length > 0)
         {
            _loc2_ = _621.instance._3690;
         }
         else
         {
            _loc2_ = _621.instance._3691;
         }
         if(_loc2_ != null && _loc2_.length > 0)
         {
            if(this._5426)
            {
               this._5426._5421 = _loc2_;
            }
            if(this._3655 != null)
            {
               this._3655(_loc2_);
            }
         }
         else if(this._3655 != null)
         {
            this._3655(null);
         }
      }
      
      public function set _3608(param1:_765) : void
      {
         this._3639 = param1;
      }
      
      public function get _3692() : BitmapData
      {
         return this._5424;
      }
      
      public function get textureConfig() : Object
      {
         return this._5423;
      }
      
      private function get _3602() : ExportController
      {
         return _1407.getInstance(ExportController) as ExportController;
      }
   }
}

