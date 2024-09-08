package _609
{
   import _721._765;
   import flash.display.BitmapData;
   
   public class _621
   {
      public static var instance:_621;
      
      public static const TYPE_DRAGONBONES:int = 0;
      
      public static const TYPE_MOVIECLIP:int = 1;
      
      public static const TYPE_SPRITESHEET:int = 2;
      
      public var type:int;
      
      public var images:Array;
      
      public var _3691:Vector.<BitmapData>;
      
      public var _3690:Vector.<BitmapData>;
      
      public var _5414:Boolean;
      
      public var _3610:Boolean;
      
      public var _3611:Boolean;
      
      public var _5427:Boolean;
      
      public var _5413:Boolean;
      
      public var _3616:Object;
      
      public var _3693:Array;
      
      public var _3705:Array;
      
      public var _3608:_765;
      
      public function _621()
      {
         super();
      }
      
      public function dispose() : void
      {
         this.clear();
      }
      
      public function _5409() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._3690)
         {
            _loc1_ = 0;
            _loc2_ = int(this._3690.length);
            while(_loc1_ < _loc2_)
            {
               this._3690[_loc1_].dispose();
               this._3690[_loc1_] = null;
               _loc1_++;
            }
            this._3690.length = 0;
         }
      }
      
      public function _5410() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._3691)
         {
            _loc1_ = 0;
            _loc2_ = int(this._3691.length);
            while(_loc1_ < _loc2_)
            {
               this._3691[_loc1_].dispose();
               this._3691[_loc1_] = null;
               _loc1_++;
            }
            this._3691.length = 0;
         }
      }
      
      public function clear() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this._5414 = false;
         this._3610 = false;
         this._5427 = false;
         this._5413 = false;
         this._5410();
         this._5409();
         if(this.type == TYPE_SPRITESHEET)
         {
            _loc1_ = 0;
            _loc2_ = int(this.images.length);
            while(_loc1_ < _loc2_)
            {
               this.images[_loc1_].assetData.dispose();
               this.images[_loc1_].assetData = null;
               _loc1_++;
            }
         }
         if(this.images)
         {
            this.images.length = 0;
         }
      }
   }
}

