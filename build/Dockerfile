FROM node:lts-alpine

LABEL version="1.0.0"
LABEL repository="https://github.com/elstudio/actions-js-build"
LABEL homepage="https://github.com/elstudio/actions-js-build"
LABEL maintainer="el-studio Actions <servers+actions@el-studio.com>"

LABEL com.github.actions.name="GitHub Action for javascript build tools"
LABEL com.github.actions.description="Wraps the npm CLI to enable common js build commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
