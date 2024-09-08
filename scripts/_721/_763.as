package _721
{
   public class _763
   {
      public static const DEFAULT_WIDTH:int = 800;
      
      public static const DEFAULT_HEIGHT:int = 600;
      
      public static const TYPE_OLD:int = 0;
      
      public static const TYPE_NEW:int = 1;
      
      public var width:int;
      
      public var height:int;
      
      public var bgColor:uint;
      
      public var x:int;
      
      public var y:int;
      
      public var opened:Boolean;
      
      public var hasBackground:Boolean;
      
      public var _13227:Boolean;
      
      public var type:int = 0;
      
      public function _763()
      {
         super();
      }
      
      public static function _5941() : _763
      {
         return _1572(800,600,16777215);
      }
      
      public static function _1572(param1:int, param2:int, param3:uint, param4:int = 0, param5:int = 0, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false) : _763
      {
         var _loc9_:_763 = new _763();
         _loc9_._3120(param1,param2,param3);
         _loc9_.x = param4;
         _loc9_.y = param5;
         _loc9_.hasBackground = param6;
         _loc9_.opened = param7;
         _loc9_._13227 = param8;
         return _loc9_;
      }
      
      public function _3120(param1:Number, param2:Number, param3:uint) : void
      {
         this.width = param1;
         this.height = param2;
         this.bgColor = param3;
      }
      
      public function _10373() : Object
      {
         var _loc1_:Object = {};
         _loc1_.width = this.width;
         _loc1_.height = this.height;
         _loc1_.bgColor = this.bgColor;
         _loc1_.x = this.x;
         _loc1_.y = this.y;
         _loc1_.opened = this.opened;
         _loc1_.hasBackground = this.hasBackground;
         _loc1_._13227 = this._13227;
         return _loc1_;
      }
      
      public function _13237() : Object
      {
         var _loc1_:Object = {};
         _loc1_.width = this.width;
         _loc1_.height = this.height;
         if(this.hasBackground)
         {
            _loc1_.color = this.bgColor;
         }
         _loc1_.x = this.x;
         _loc1_.y = this.y;
         return _loc1_;
      }
   }
}

