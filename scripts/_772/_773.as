package _772
{
   public class _773 implements _774
   {
      public static const SHORTCUT:int = 1;
      
      public static const WELCOME:int = 2;
      
      public static const MENU:int = 3;
      
      public static const TOOLBAR:int = 4;
      
      public static const DRAG:int = 5;
      
      public static const EXAMPLE:int = 6;
      
      public static const PHOTOSHOP:int = 7;
      
      public static const TYPE_DB:int = 1;
      
      public static const TYPE_SPINE:int = 2;
      
      public static const TYPE_COCOS:int = 3;
      
      public static const TYPE_PHOTOSHOP:int = 5;
      
      public static const UNPACK:int = 1;
      
      public static const ZIP:int = 2;
      
      public static const PNG:int = 3;
      
      public static const SWF:int = 4;
      
      public static const TEXTURE:int = 1;
      
      public static const IMAGES:int = 2;
      
      public var name:int = 42;
      
      public var op:int;
      
      public var type:*;
      
      public var value1:int;
      
      public var value2:int;
      
      public var value3:*;
      
      public var value4:int;
      
      public var dVer:String;
      
      public var result:String;
      
      public function _773()
      {
         super();
      }
      
      public function _5965() : Object
      {
         var _loc1_:Object = {};
         _loc1_.Name = this.name;
         _loc1_.op = this.op;
         _loc1_.type = this.type;
         _loc1_.result = this.result;
         _loc1_.mcNum = this.value1;
         _loc1_.amNum = this.value2;
         _loc1_.ever = this.dVer;
         _loc1_["package"] = this.value3;
         _loc1_.texture = this.value4;
         return _loc1_;
      }
   }
}

