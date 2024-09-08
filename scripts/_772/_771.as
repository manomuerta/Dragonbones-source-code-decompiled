package _772
{
   public class _771 implements _774
   {
      public static const KEY_PACKAGE:String = "package";
      
      public static const KEY_ANI:String = "ani";
      
      public static const SHORTCUT:int = 1;
      
      public static const WELCOME:int = 2;
      
      public static const MENU:int = 3;
      
      public static const TOOLBAR:int = 4;
      
      public static const TYPE_DB:int = 1;
      
      public static const TYPE_MC:int = 2;
      
      public static const TYPE_PNGS:int = 3;
      
      public static const UNPACK:int = 1;
      
      public static const ZIP:int = 2;
      
      public static const TEXTURE:int = 1;
      
      public static const IMAGES:int = 2;
      
      public static const ANI_ALL:int = 1;
      
      public static const ANI_CUR:int = 2;
      
      public static const ANI_CUS:int = 3;
      
      public var name:int = 43;
      
      public var op:int;
      
      public var type:*;
      
      public var value1:int;
      
      public var value2:int;
      
      public var value3:int;
      
      public var value4:int;
      
      public var value5:uint;
      
      public var value6:Number;
      
      public var dVer:Number;
      
      public var ani:int;
      
      public var result:String;
      
      public function _771()
      {
         super();
      }
      
      public function _5965() : Object
      {
         var _loc1_:Object = {};
         _loc1_.Name = this.name;
         _loc1_.op = this.op;
         _loc1_.type = this.type;
         _loc1_.mcNum = this.value1;
         _loc1_.amNum = this.value2;
         _loc1_.dVer = this.dVer;
         _loc1_["package"] = this.value3;
         _loc1_.texture = this.value4;
         _loc1_.bgColor = this.value5.toString(16);
         _loc1_.scale = this.value6;
         _loc1_.ani = this.ani;
         _loc1_.result = this.result;
         return _loc1_;
      }
   }
}

