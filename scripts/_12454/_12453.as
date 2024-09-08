package _12454
{
   import _1404._1407;
   import _346._361;
   import _477.ExportController;
   import _93._92;
   import egret.utils.FileUtil;
   import flash.utils.setTimeout;
   
   public class _12453 extends _92
   {
      private const PROJECT_PATH:String = "projectpath";
      
      private const OUTPUT_PATH:String = "outputpath";
      
      private const OUTPUT_SETTING:String = "outputsetting";
      
      private const TYPE:String = "type";
      
      private const IMAGE_FORMAT:String = "imgformat";
      
      private const ANIMATE:String = "aniname";
      
      private const FRAME:String = "frame";
      
      private const SCALE:String = "scale";
      
      private const BGCOLOR:String = "bgcolor";
      
      private const FPS:String = "fps";
      
      private const TEXTURE_SETTING:String = "texturesetting";
      
      private var _12552:Object;
      
      public function _12453()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         super._1572(param1);
         this._12552 = {};
         var _loc2_:Array = param1 as Array;
         _loc2_.shift();
         _loc3_ = 0;
         _loc4_ = int(_loc2_.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc2_[_loc3_];
            if((_loc6_ = _loc5_.split("=")).length == 2)
            {
               this._12552[_loc6_[0].toLowerCase()] = _loc6_[1];
            }
            _loc3_++;
         }
      }
      
      override public function execute() : void
      {
         var openCmd:_361 = null;
         var exportParam:_12455 = null;
         var projectPath:String = this._12552[this.PROJECT_PATH];
         if(Boolean(projectPath) && FileUtil.exists(projectPath))
         {
            openCmd = new _361();
            openCmd._1572(projectPath);
            openCmd.execute();
            exportParam = new _12455(this._12552);
            setTimeout(function():void
            {
               _3602._12551(new _12455(_12552));
            },1);
         }
      }
      
      private function get _3602() : ExportController
      {
         return _1407.getInstance(ExportController) as ExportController;
      }
   }
}

