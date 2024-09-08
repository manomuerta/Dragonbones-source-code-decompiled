package _710
{
   import _73._74;
   
   public class _712 extends _709
   {
      public static const BLANK:_712 = new _712("blank");
      
      public static const BONE:_712 = new _712("bone");
      
      public static const SLOT:_712 = new _712("slot");
      
      public static const IMAGE:_712 = new _712("image");
      
      public static const MESH:_712 = new _712("mesh");
      
      public static const BOUNDINGBOX:_712 = new _712("boundingBox");
      
      public static const MAIN_SYMBOL:_712 = new _712("mainSymbol");
      
      public static const CHILD_SYMBOL:_712 = new _712("childSymbol");
      
      public static const FRAME:_712 = new _712("frame");
      
      public static const TIMELINE:_712 = new _712("timeline");
      
      public static const ARMATURE:_712 = new _712("armature");
      
      public static const ASSET:_712 = new _712("asset");
      
      public static const FOLDER:_712 = new _712("folder");
      
      public static const VITUALFOLDER:_712 = new _712("vitualfolder");
      
      public static const ANIMATION:_712 = new _712("animation");
      
      public static const ADD_TWEEN:_712 = new _712("addTween");
      
      public static const ADD_ACTION:_712 = new _712("addAction");
      
      public static const ADD_APPEAR:_712 = new _712("addAppear");
      
      public static const ADD_DISAPPEAR:_712 = new _712("addDisAppear");
      
      public static const CHANGE_TWEEN:_712 = new _712("changeTween");
      
      public static const CHANGE_APPEAR_TWEEN:_712 = new _712("changeAppearTween");
      
      public static const CHANGE_DISAPPEAR_TWEEN:_712 = new _712("changeDisappearTween");
      
      public function _712(param1:String)
      {
         super(param1);
      }
      
      public static function _4476(param1:_74) : _712
      {
         switch(param1)
         {
            case _74.ARMATURE:
               return CHILD_SYMBOL;
            case _74.IMAGE:
               return IMAGE;
            case _74.MESH:
               return MESH;
            case _74.BOUNDINGBOX:
               return BOUNDINGBOX;
            default:
               return null;
         }
      }
   }
}

