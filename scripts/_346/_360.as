package _346
{
   import _11111._11110;
   import _1404._1407;
   import _521._532;
   import _555.LibraryPanelController;
   import _579._581;
   import _648._665;
   import _777._779;
   import _93._92;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.filesystem.File;
   
   public class _360 extends _92
   {
      private var _3290:_361;
      
      public function _360()
      {
         this._3290 = new _361();
         super();
         _2219 = false;
         _2215 = false;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         this.projectPath = FileUtil.escapePath(this.projectPath);
      }
      
      override public function execute() : void
      {
         var _loc2_:File = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:_368 = null;
         this._2226._2484 = null;
         var _loc1_:File = new File(this.projectPath);
         if(_loc1_.exists)
         {
            _loc2_ = _loc1_.parent;
            _loc3_ = _loc1_.name.substr(0,_loc1_.name.length - _loc1_.extension.length - 1);
            _loc4_ = _loc1_.extension;
            _loc6_ = 1;
            do
            {
               _loc5_ = _loc3_ + "_" + String(_loc6_++) + "." + _loc4_;
               _loc1_ = _loc2_.resolvePath(_loc5_);
            }
            while(_loc1_.exists);
            
            this.projectPath = FileUtil.escapePath(_loc1_.nativePath);
         }
         if(_665._3272(this.projectPath,this._3292,this._3294,this._13240))
         {
            this._3290._1572(this.projectPath);
            this._3290.execute();
            _779.instance._3293(_779.PARAM_RESULT,0);
            _779.instance._3291();
            _11110.instance._11133._11132();
         }
         else
         {
            _loc7_ = new _368();
            _loc7_._1572(tr("OpenProject.fail"));
            _loc7_.execute();
            _779.instance._3293(_779.PARAM_RESULT,"fail");
            _779.instance._3291();
            _11110.instance._11133.fail("OpenProject.fail");
            _11110.instance._11133._11132();
         }
      }
      
      protected function get _3294() : Object
      {
         return _2223._3294;
      }
      
      protected function get projectPath() : String
      {
         return _2223.projectPath;
      }
      
      protected function get _3292() : Array
      {
         return _2223._3292;
      }
      
      protected function get _13240() : Array
      {
         return _2223._13240;
      }
      
      protected function get projectName() : String
      {
         return FileUtil.getFileName(this.projectPath);
      }
      
      protected function get _3280() : String
      {
         return FileUtil.getDirectory(this.projectPath);
      }
      
      protected function set projectPath(param1:String) : void
      {
         _2223.projectPath = param1;
      }
      
      protected function get _3219() : _581
      {
         return _1407.getInstance(_581) as _581;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      private function get _2226() : _532
      {
         return _1407.getInstance(_532) as _532;
      }
   }
}

