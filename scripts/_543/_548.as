package _543
{
   import _11106._11108;
   import _11111._11110;
   import _1404._1407;
   import _28._29;
   import _541._540;
   import _555.LibraryPanelController;
   import _710._713;
   import _783.MenuNotification;
   import _874._873;
   import _97._115;
   
   public class _548 extends _544
   {
      public function _548(param1:_873, param2:_540)
      {
         super(param1,param2);
      }
      
      override public function _3935(param1:_29) : void
      {
         _11110.instance._11593(param1.userData,_11108.LibraryContextMenu);
         switch(param1.id)
         {
            case _713.RENAME:
               _1567(new MenuNotification(param1.userData,null,"libraryPanel"));
               break;
            case _713.DUPLICATE:
               this._1567(new MenuNotification(MenuNotification.DUPLICATE,null,"librarypanel"));
            default:
               this._1567(new MenuNotification(param1.userData,param1.id.toString(),Boolean(targets) && targets.length > 0 ? targets[0] : null));
         }
      }
      
      override protected function _3941(param1:Array) : void
      {
      }
      
      override protected function _3939() : void
      {
         var _loc1_:_29 = _115._2364(_713.DELETE_ARMATURE) as _29;
         var _loc2_:_29 = _115._2364(_713.IMPORT_ASSET) as _29;
         var _loc3_:_29 = _115._2364(_713.RENAME) as _29;
         var _loc4_:_29 = _115._2364(_713.DELETE_VITUAL_FOLDER) as _29;
         if(_loc1_)
         {
            _loc1_.enabled = this._2861.checkDeleteArmature();
         }
         if(_loc2_)
         {
            _loc2_.enabled = this._2861.getImportAssetEnable();
         }
         if(_loc3_)
         {
            _loc3_.enabled = this._2861.getRenameAssetEnable();
         }
         if(_loc4_)
         {
            _loc4_.enabled = this._2861.checkDeleteVitualFolder();
         }
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

