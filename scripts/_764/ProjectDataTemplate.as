package _764
{
   import _73.SymbolType;
   import _97._101;
   
   public class ProjectDataTemplate
   {
      private static var _5947:Class = ProjectDataTemplate__5947;
      
      public function ProjectDataTemplate()
      {
         super();
      }
      
      public static function generate(param1:Array = null, param2:Array = null) : Object
      {
         var _loc6_:SymbolType = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc3_:String = String(new _5947());
         var _loc4_:Object = JSON.parse(_loc3_);
         var _loc5_:Array = _loc4_[_101.DRAGON_BONES][_101.ARMATURE] as Array;
         for each(_loc6_ in param1)
         {
            (_loc7_ = {})[_101.A_TYPE] = _loc6_.toString();
            if(_loc6_ == SymbolType.SHEET)
            {
               _loc7_[_101.A_NAME] = "Sprite";
            }
            else
            {
               _loc7_[_101.A_NAME] = _loc6_.toString();
            }
            _loc5_.push(_loc7_);
            if(Boolean(param2) && param2.length == 2)
            {
               (_loc8_ = {}).x = 0;
               _loc8_.y = 0;
               _loc8_.width = param2[0] > 0 ? param2[0] : 800;
               _loc8_.height = param2[1] > 0 ? param2[1] : 600;
               _loc8_.hasBackground = false;
               _loc8_.opened = true;
               _loc8_.bgColor = 16777215;
               _loc8_._13227 = false;
               _loc7_.canvas = _loc8_;
            }
         }
         return _loc4_;
      }
   }
}

